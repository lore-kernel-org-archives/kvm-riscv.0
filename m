From: Ben Gardon <bgardon@google.com>
Date: Thu, 4 Nov 2021 14:27:59 -0700
Subject: [PATCH v5.5 01/30] KVM: Ensure local memslot copies operate on
 up-to-date arch-specific data
In-Reply-To: <20211104002531.1176691-2-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-2-seanjc@google.com>
Message-ID: <CANgfPd-uuPFjAHk5kVNom2Qs=UU_GX6CQ0xDLg1h_iL8t8S2aQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 3, 2021 at 5:26 PM Sean Christopherson <seanjc@google.com> wrote:
>
> When modifying memslots, snapshot the "old" memslot and copy it to the
> "new" memslot's arch data after (re)acquiring slots_arch_lock.  x86 can
> change a memslot's arch data while memslot updates are in-progress so
> long as it holds slots_arch_lock, thus snapshotting a memslot without
> holding the lock can result in the consumption of stale data.
>
> Fixes: b10a038e84d1 ("KVM: mmu: Add slots_arch_lock for memslot arch fields")
> Cc: stable at vger.kernel.org
> Cc: Ben Gardon <bgardon@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 47 ++++++++++++++++++++++++++++++---------------
>  1 file changed, 31 insertions(+), 16 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 3f6d450355f0..99e69375c4c9 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1531,11 +1531,10 @@ static struct kvm_memslots *kvm_dup_memslots(struct kvm_memslots *old,
>
>  static int kvm_set_memslot(struct kvm *kvm,
>                            const struct kvm_userspace_memory_region *mem,
> -                          struct kvm_memory_slot *old,
>                            struct kvm_memory_slot *new, int as_id,
>                            enum kvm_mr_change change)
>  {
> -       struct kvm_memory_slot *slot;
> +       struct kvm_memory_slot *slot, old;
>         struct kvm_memslots *slots;
>         int r;
>
> @@ -1566,7 +1565,7 @@ static int kvm_set_memslot(struct kvm *kvm,
>                  * Note, the INVALID flag needs to be in the appropriate entry
>                  * in the freshly allocated memslots, not in @old or @new.
>                  */
> -               slot = id_to_memslot(slots, old->id);
> +               slot = id_to_memslot(slots, new->id);

Since new is guaranteed to have the same id as old (at least prior to
this change) this is a no-op change, so no problem here.
This could be a separate commit which would have no functional change
but only worth extracting if you send a v2.

>                 slot->flags |= KVM_MEMSLOT_INVALID;
>
>                 /*
> @@ -1597,6 +1596,26 @@ static int kvm_set_memslot(struct kvm *kvm,
>                 kvm_copy_memslots(slots, __kvm_memslots(kvm, as_id));
>         }
>
> +       /*
> +        * Make a full copy of the old memslot, the pointer will become stale
> +        * when the memslots are re-sorted by update_memslots(), and the old
> +        * memslot needs to be referenced after calling update_memslots(), e.g.
> +        * to free its resources and for arch specific behavior.  This needs to
> +        * happen *after* (re)acquiring slots_arch_lock.
> +        */
> +       slot = id_to_memslot(slots, new->id);
> +       if (slot) {
> +               old = *slot;
> +       } else {
> +               WARN_ON_ONCE(change != KVM_MR_CREATE);
> +               memset(&old, 0, sizeof(old));
> +               old.id = new->id;
> +               old.as_id = as_id;
> +       }
> +
> +       /* Copy the arch-specific data, again after (re)acquiring slots_arch_lock. */
> +       memcpy(&new->arch, &old.arch, sizeof(old.arch));
> +

Is new->arch not initialized before this function is called? Does this
need to be here, or could it be moved above into the first branch of
the if statement?
Oh I see you removed the memset below and replaced it with this. I
think this is fine, but it might be easier to reason about if we left
the memset and moved the memcopy into the if.
No point in doing a memcpy of zeros here.

>         r = kvm_arch_prepare_memory_region(kvm, new, mem, change);
>         if (r)
>                 goto out_slots;
> @@ -1604,14 +1623,18 @@ static int kvm_set_memslot(struct kvm *kvm,
>         update_memslots(slots, new, change);
>         slots = install_new_memslots(kvm, as_id, slots);
>
> -       kvm_arch_commit_memory_region(kvm, mem, old, new, change);
> +       kvm_arch_commit_memory_region(kvm, mem, &old, new, change);
> +
> +       /* Free the old memslot's metadata.  Note, this is the full copy!!! */
> +       if (change == KVM_MR_DELETE)
> +               kvm_free_memslot(kvm, &old);
>
>         kvfree(slots);
>         return 0;
>
>  out_slots:
>         if (change == KVM_MR_DELETE || change == KVM_MR_MOVE) {
> -               slot = id_to_memslot(slots, old->id);
> +               slot = id_to_memslot(slots, new->id);
>                 slot->flags &= ~KVM_MEMSLOT_INVALID;
>                 slots = install_new_memslots(kvm, as_id, slots);
>         } else {
> @@ -1626,7 +1649,6 @@ static int kvm_delete_memslot(struct kvm *kvm,
>                               struct kvm_memory_slot *old, int as_id)
>  {
>         struct kvm_memory_slot new;
> -       int r;
>
>         if (!old->npages)
>                 return -EINVAL;
> @@ -1639,12 +1661,7 @@ static int kvm_delete_memslot(struct kvm *kvm,
>          */
>         new.as_id = as_id;
>
> -       r = kvm_set_memslot(kvm, mem, old, &new, as_id, KVM_MR_DELETE);
> -       if (r)
> -               return r;
> -
> -       kvm_free_memslot(kvm, old);
> -       return 0;
> +       return kvm_set_memslot(kvm, mem, &new, as_id, KVM_MR_DELETE);
>  }
>
>  /*
> @@ -1718,7 +1735,6 @@ int __kvm_set_memory_region(struct kvm *kvm,
>         if (!old.npages) {
>                 change = KVM_MR_CREATE;
>                 new.dirty_bitmap = NULL;
> -               memset(&new.arch, 0, sizeof(new.arch));
>         } else { /* Modify an existing slot. */
>                 if ((new.userspace_addr != old.userspace_addr) ||
>                     (new.npages != old.npages) ||
> @@ -1732,9 +1748,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
>                 else /* Nothing to change. */
>                         return 0;
>
> -               /* Copy dirty_bitmap and arch from the current memslot. */
> +               /* Copy dirty_bitmap from the current memslot. */
>                 new.dirty_bitmap = old.dirty_bitmap;
> -               memcpy(&new.arch, &old.arch, sizeof(new.arch));
>         }
>
>         if ((change == KVM_MR_CREATE) || (change == KVM_MR_MOVE)) {
> @@ -1760,7 +1775,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
>                         bitmap_set(new.dirty_bitmap, 0, new.npages);
>         }
>
> -       r = kvm_set_memslot(kvm, mem, &old, &new, as_id, change);
> +       r = kvm_set_memslot(kvm, mem, &new, as_id, change);
>         if (r)
>                 goto out_bitmap;
>
> --
> 2.33.1.1089.g2158813163f-goog
>

