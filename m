From: Vipin Sharma <vipinsh@google.com>
Date: Tue, 6 Jun 2023 10:30:42 -0700
Subject: [PATCH v2 09/16] KVM: arm64: Document the page table walker
 actions based on the callback's return value
In-Reply-To: <20230605223520.00007fbd.zhi.wang.linux@gmail.com>
References: <20230602160914.4011728-1-vipinsh@google.com>
 <20230602160914.4011728-10-vipinsh@google.com>
 <20230605223520.00007fbd.zhi.wang.linux@gmail.com>
Message-ID: <ZH9tQjQk7QLyhUQR@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 05, 2023 at 10:35:20PM +0800, Zhi Wang wrote:
> On Fri,  2 Jun 2023 09:09:07 -0700
> Vipin Sharma <vipinsh@google.com> wrote:
> 
> > Document what the page table walker do when walker callback function returns
> > a value.
> > 
> > Current documentation is not correct as negative error of -EAGAIN on a
> > non-shared page table walker doesn't terminate the walker and continues
> > to the next step.
> > 
> > There might be a better place to keep this information, for now this
> > documentation will work as a reference guide until a better way is
> > found.
> >
> 
> After reading the whole patch series, I was thinking it might be a good
> time to improve the way how the visitor function and page table walker
> talk to each other. The error code is good enough before, but its meaning
> seems limited and vague when the visitor function wants to express more about
> what exactly happens inside. I am not sure if it is a good idea to continue
> that way: 1. found a new situation. 2. choosing a error code for visitor
> function. 3. walker translates the error code into the situation to
> handle. 4. document the error code and its actual meaning.
> 
> Eventually I am afraid that we are going to abuse the error code.

I agree that error numbers are not sufficient and this will become more
difficult and cumbersome for more cases in future if we need different
behavior based on different error codes for different visitor functions.

> 
> What about introducing a set of flags for the visitor function to express
> what happened and simplify the existing error code?
> 

If I understood correctly what you meant, I think this will also end up
having the same issue down the line, we are just switching errors with
flags as they might not be able to express everything.

"Flags for visitor function to express what happened"  - This is what
ret val and errors do.

"simplify existing error code" - is very dependent on visitor function
and caller of page table walker. This might not be able to cover all
cases for the future also.

But I do agree that just error code is not sufficient and it will make
it harder to handle shared vs non-shared walkers combinations with error
code from visitor functions and walk action (exit, next, retry).

One approach I can think of is:
Based on the visitor function return value, a page table walker will do
3 things:

1. Move to next SPTE
2. Retry the current SPTE
3. Exit the walk and return the exit code.

struct kvm_pgtable_walker{}  will have two more callbacks
1. kvm_pgtable_walk_ignore(int ret, enum kvm_pgtable_walk_flags):
   This will be set for each walker and walker will check with this
   function intead of kvm_pgtable_walk_continue().

2. kvm_pgtable_walk_retry(int ret, enum kvm_pgtable_walk_flags):
   This will be set for each walker and walker will use it in
   __kvm_pgtable_walk()  on the return value of __kvm_pgtable_visit() to
   retry again.

This will allow to have walker be more configurable and each type of
walker can be customized based on vistor function return and
shared/non-shared walker combo. It will avoid having visitor function
error code handling same in all walkers.

Below is a sample code (compile tested only):

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 850d65f705fa..9a96f61208af 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -243,6 +243,10 @@ struct kvm_pgtable_visit_ctx {
 
 typedef int (*kvm_pgtable_visitor_fn_t)(const struct kvm_pgtable_visit_ctx *ctx,
 					enum kvm_pgtable_walk_flags visit);
+struct kvm_pgtable_walker;
+typedef bool (*kvm_pgtable_walker_action_fn_t)(const struct kvm_pgtable_walker *walker,
+					      int ret);
+
 
 static inline bool kvm_pgtable_walk_shared(const struct kvm_pgtable_visit_ctx *ctx)
 {
@@ -258,6 +262,8 @@ static inline bool kvm_pgtable_walk_shared(const struct kvm_pgtable_visit_ctx *c
  */
 struct kvm_pgtable_walker {
 	const kvm_pgtable_visitor_fn_t		cb;
+	const kvm_pgtable_walker_action_fn_t	ignore;
+	const kvm_pgtable_walker_action_fn_t	retry;
 	void * const				arg;
 	const enum kvm_pgtable_walk_flags	flags;
 };
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 364b68013038..28891a9c463a 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -180,6 +180,12 @@ static int kvm_pgtable_visitor_cb(struct kvm_pgtable_walk_data *data,
 	return walker->cb(ctx, visit);
 }
 
+static bool kvm_pgtable_walk_retry(const struct kvm_pgtable_walker *walker,
+				      int r)
+{
+	return false;
+}
+
 static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
 				      int r)
 {
@@ -231,7 +237,7 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
 		table = kvm_pte_table(ctx.old, level);
 	}
 
-	if (!kvm_pgtable_walk_continue(data->walker, ret))
+	if (!data->walker->ignore(data->walker, ret))
 		goto out;
 
 	if (!table) {
@@ -242,14 +248,14 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
 
 	childp = (kvm_pteref_t)kvm_pte_follow(ctx.old, mm_ops);
 	ret = __kvm_pgtable_walk(data, mm_ops, childp, level + 1);
-	if (!kvm_pgtable_walk_continue(data->walker, ret))
+	if (!data->walker->ignore(data->walker, ret))
 		goto out;
 
 	if (ctx.flags & KVM_PGTABLE_WALK_TABLE_POST)
 		ret = kvm_pgtable_visitor_cb(data, &ctx, KVM_PGTABLE_WALK_TABLE_POST);
 
 out:
-	if (kvm_pgtable_walk_continue(data->walker, ret))
+	if (!data->walker->ignore(data->walker, ret))
 		return 0;
 
 	return ret;
@@ -260,19 +266,25 @@ static int __kvm_pgtable_walk(struct kvm_pgtable_walk_data *data,
 {
 	u32 idx;
 	int ret = 0;
+	kvm_pteref_t pteref;
 
 	if (WARN_ON_ONCE(level >= KVM_PGTABLE_MAX_LEVELS))
 		return -EINVAL;
 
 	for (idx = kvm_pgtable_idx(data, level); idx < PTRS_PER_PTE; ++idx) {
-		kvm_pteref_t pteref = &pgtable[idx];
+retry:
+		pteref = &pgtable[idx];
 
 		if (data->addr >= data->end)
 			break;
 
 		ret = __kvm_pgtable_visit(data, mm_ops, pteref, level);
-		if (ret)
+		if (ret) {
+			if (data->walker->retry(data->walker, ret)) {
+				goto retry;
+			}
 			break;
+		}
 	}
 
 	return ret;
@@ -343,6 +355,8 @@ int kvm_pgtable_get_leaf(struct kvm_pgtable *pgt, u64 addr,
 	struct leaf_walk_data data;
 	struct kvm_pgtable_walker walker = {
 		.cb	= leaf_walker,
+		.ignore = kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.flags	= KVM_PGTABLE_WALK_LEAF,
 		.arg	= &data,
 	};
@@ -474,6 +488,8 @@ int kvm_pgtable_hyp_map(struct kvm_pgtable *pgt, u64 addr, u64 size, u64 phys,
 	};
 	struct kvm_pgtable_walker walker = {
 		.cb	= hyp_map_walker,
+		.ignore = kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.flags	= KVM_PGTABLE_WALK_LEAF,
 		.arg	= &map_data,
 	};
@@ -533,6 +549,8 @@ u64 kvm_pgtable_hyp_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 	u64 unmapped = 0;
 	struct kvm_pgtable_walker walker = {
 		.cb	= hyp_unmap_walker,
+		.ignore = kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.arg	= &unmapped,
 		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
 	};
@@ -582,6 +600,8 @@ void kvm_pgtable_hyp_destroy(struct kvm_pgtable *pgt)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= hyp_free_walker,
+		.ignore = kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
 	};
 
@@ -958,6 +978,8 @@ int kvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	};
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_map_walker,
+		.ignore		= kvm_pgtable_walk_continue,
+		.retry		= kvm_pgtable_walk_retry,
 		.flags		= flags |
 				  KVM_PGTABLE_WALK_TABLE_PRE |
 				  KVM_PGTABLE_WALK_LEAF,
@@ -989,6 +1011,8 @@ int kvm_pgtable_stage2_set_owner(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	};
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_map_walker,
+		.ignore		= kvm_pgtable_walk_continue,
+		.retry		= kvm_pgtable_walk_retry,
 		.flags		= KVM_PGTABLE_WALK_TABLE_PRE |
 				  KVM_PGTABLE_WALK_LEAF,
 		.arg		= &map_data,
@@ -1048,6 +1072,8 @@ int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_unmap_walker,
+		.ignore	= kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.arg	= pgt,
 		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
 	};
@@ -1070,7 +1096,7 @@ static int stage2_attr_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
 
 	if (!kvm_pte_valid(ctx->old))
-		return -EAGAIN;
+		return -ENOENT;
 
 	data->level = ctx->level;
 	data->pte = pte;
@@ -1099,6 +1125,23 @@ static int stage2_attr_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
+static bool stage2_attr_walker_retry(const struct kvm_pgtable_walker *walker, int ret)
+{
+	if (ret == -EAGAIN)
+		return walker->flags & KVM_PGTABLE_WALK_SHARED
+				&& !(walker->flags & KVM_PGTABLE_WALK_HANDLE_FAULT);
+	return false;
+}
+
+static bool stage2_attr_walker_ignore(const struct kvm_pgtable_walker * walker, int ret)
+{
+	if (ret == -EAGAIN)
+		return !(walker->flags & KVM_PGTABLE_WALK_SHARED);
+	if (ret == -ENOENT)
+		return !(walker->flags & KVM_PGTABLE_WALK_HANDLE_FAULT);
+	return false;
+}
+
 static int stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
 				    u64 size, kvm_pte_t attr_set,
 				    kvm_pte_t attr_clr, kvm_pte_t *orig_pte,
@@ -1112,6 +1155,8 @@ static int stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
 	};
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_attr_walker,
+		.ignore		= stage2_attr_walker_ignore,
+		.retry		= stage2_attr_walker_retry,
 		.arg		= &data,
 		.flags		= flags | KVM_PGTABLE_WALK_LEAF,
 	};
@@ -1217,6 +1262,8 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_flush_walker,
+		.ignore	= kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.flags	= KVM_PGTABLE_WALK_LEAF,
 		.arg	= pgt,
 	};
@@ -1240,6 +1287,8 @@ kvm_pte_t *kvm_pgtable_stage2_create_unlinked(struct kvm_pgtable *pgt,
 	};
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_map_walker,
+		.ignore		= kvm_pgtable_walk_continue,
+		.retry		= kvm_pgtable_walk_retry,
 		.flags		= KVM_PGTABLE_WALK_LEAF |
 				  KVM_PGTABLE_WALK_SKIP_BBM_TLBI |
 				  KVM_PGTABLE_WALK_SKIP_CMO,
@@ -1377,6 +1426,8 @@ int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_split_walker,
+		.ignore	= kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.flags	= KVM_PGTABLE_WALK_LEAF,
 		.arg	= mc,
 	};
@@ -1442,6 +1493,8 @@ void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
 	size_t pgd_sz;
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_free_walker,
+		.ignore	= kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.flags	= KVM_PGTABLE_WALK_LEAF |
 			  KVM_PGTABLE_WALK_TABLE_POST,
 	};
@@ -1457,6 +1510,8 @@ void kvm_pgtable_stage2_free_unlinked(struct kvm_pgtable_mm_ops *mm_ops, void *p
 	kvm_pteref_t ptep = (kvm_pteref_t)pgtable;
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_free_walker,
+		.ignore	= kvm_pgtable_walk_continue,
+		.retry	= kvm_pgtable_walk_retry,
 		.flags	= KVM_PGTABLE_WALK_LEAF |
 			  KVM_PGTABLE_WALK_TABLE_POST,
 	};

