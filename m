From: Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 23 Mar 2023 14:50:10 -0000
Subject: [PATCH] riscv: require alternatives framework when selecting FPU
 support
In-Reply-To: <CAHmME9qEbUP7cq-iofN=ruSWhsHUva+qqavfEpNzDK_BjQVqxw@mail.gmail.com>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel>
 <1884bd96-2783-4556-bc57-8b733758baff@spud>
 <20230322192610.sad42xau33ye5ayn@orel>
 <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
 <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
 <CAHmME9qEbUP7cq-iofN=ruSWhsHUva+qqavfEpNzDK_BjQVqxw@mail.gmail.com>
Message-ID: <af690061-f962-498e-b2df-d2e6119292cf@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 22, 2023 at 09:19:50PM +0100, Jason A. Donenfeld wrote:
> On Wed, Mar 22, 2023 at 9:05?PM Conor Dooley <conor@kernel.org> wrote:
> >
> > On Wed, Mar 22, 2023 at 07:44:13PM +0000, Conor Dooley wrote:
> > > On Wed, Mar 22, 2023 at 08:26:10PM +0100, Andrew Jones wrote:
> > > > On Wed, Mar 22, 2023 at 03:17:13PM +0000, Conor Dooley wrote:
> > > > > On Wed, Mar 22, 2023 at 01:46:31PM +0100, Andrew Jones wrote:
> > >
> > > > > > (It's tempting to just select RISCV_ALTERNATIVE from RISCV, but maybe we
> > > > > >  can defer that wedding a bit longer.)
> > > > >
> > > > > At that point, the config option should just go away entirely, no?
> > > >
> > > > Ah, yes, and that makes the idea even more attractive, as we could remove
> > > > several ifdefs.
> > >
> > > I went and did the cursory check, it's not compatible with XIP_KERNEL so
> > > dropping the option entirely probably isn't a possibility :/
> >
> > What I said is only now sinking in. We're now going to be disabling FPU
> > support on XIP kernels with this patch.
> > Well, technically not this patch since it wouldn't have built without
> > Jason's changes, but that doesn't seem like the right thing to do...
> 
> I suppose you could have riscv_has_extension_*() fall back to
> something that doesn't use alternatives on XIP kernels.

Yah, something like the below I guess? Probably overlooking something
silly & it's lost the benefit of the static branch that it used to have,
but with the infra that we have at the moment this seemed like the
sanest thing to do?

This would requiring picking up your patch Jason, but with an
"if !XIP_KERNEL" added to the select.

It's only had the lightest of build tests, but I can go make it a real
patch if there's not something obviously amiss.

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e3021b2590de..6263a0de1c6a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -57,18 +57,31 @@ struct riscv_isa_ext_data {
 	unsigned int isa_ext_id;
 };
 
+unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
+
+#define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
+
+bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
+#define riscv_isa_extension_available(isa_bitmap, ext)	\
+	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
+
 static __always_inline bool
 riscv_has_extension_likely(const unsigned long ext)
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
 			   "ext must be < RISCV_ISA_EXT_MAX");
 
-	asm_volatile_goto(
-	ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
-	:
-	: [ext] "i" (ext)
-	:
-	: l_no);
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		asm_volatile_goto(
+		ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
+		:
+		: [ext] "i" (ext)
+		:
+		: l_no);
+	} else {
+		if (!__riscv_isa_extension_available(NULL, ext))
+			goto l_no;
+	}
 
 	return true;
 l_no:
@@ -81,26 +94,23 @@ riscv_has_extension_unlikely(const unsigned long ext)
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
 			   "ext must be < RISCV_ISA_EXT_MAX");
 
-	asm_volatile_goto(
-	ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
-	:
-	: [ext] "i" (ext)
-	:
-	: l_yes);
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		asm_volatile_goto(
+		ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
+		:
+		: [ext] "i" (ext)
+		:
+		: l_yes);
+	} else {
+		if (__riscv_isa_extension_available(NULL, ext))
+			goto l_yes;
+	}
 
 	return false;
 l_yes:
 	return true;
 }
 
-unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
-
-#define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
-
-bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
-#define riscv_isa_extension_available(isa_bitmap, ext)	\
-	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
-
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230323/18fa9406/attachment-0001.sig>
