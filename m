Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F36FE7718D
	for <kvm-riscv@archiver.kernel.org>; Sat, 21 Dec 2024 21:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xg+PUgpm3mkxz9dG8+Biu/8ybknzl7yF4LB2cNVTEHY=; b=R8EKHCaOcYV9a5
	hrf4Hg/OByB7Yz1Ub9qo2kaaAAfWJTCOBrw+V/EXziph7jGs+EcstMgm7rjkRYgrbB7mDNmxC43zS
	KONWsybnInYBR0IhuwVjjQS473AZurNgDOfPdVWsdF8UUV3kVKvlIUSDXr8UtVJSixGvajJY1BUdm
	FLeAU1RcNEMvmTK4bI2fPXaAjVZ0dq89MrtPA/zU1u3t1+xlahZW/rmMqso1Ee/5EIqxmx6mgoc8w
	N0jtL/NAOorZlFeAA5IS+XdyfcAJnA4Z6xbeG0276gg4ezskTO9Y0oYGMbgeiZ73O6fBPcGoNDWsY
	pZhFkye3bsmNMctQJWOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP7LS-00000007SXv-3Cr4;
	Sat, 21 Dec 2024 21:49:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP7LP-00000007SUk-0YU2;
	Sat, 21 Dec 2024 21:49:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96A41A403F8;
	Sat, 21 Dec 2024 21:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796B9C4CEDC;
	Sat, 21 Dec 2024 21:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734817745;
	bh=ddnMBrXLwpca2AnEflgP/5lR3wooUpnI/oec70m/B+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bVMEC9Y+3g6+cIIS9eYVgivhAatjZ0OpNIXVQ2VcHyv7/HFz5VBer93QzOpcLyKpY
	 d/8+mRB3ScdGvGaldZRtw2UXwc3xVv1Siy0CLpaOoA62OXbZGv1hrulnOlq5X3Pg4+
	 CzRPjGDAz0d1TuK+BS6dAGxcH0ybef8UPMLT3rE/YinbeDwoNj8GUf62H/xHM2FSVc
	 qNxT4kn96rrzTcesHgC43AUD/3fVG7jwVppA0KV9SKYZmbQHFox4bW0UZ/RnYjQO3c
	 feI8HVkzyswER/TPMGQdzGXr8ehzgR3pvBwNTEa/POstchWGM79DDySwMxVgzdNh/v
	 tcZDiYCaCDvgA==
From: Arnd Bergmann <arnd@kernel.org>
To: kvm@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Graf <graf@amazon.com>,
	Crystal Wood <crwood@redhat.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Marc Zyngier <maz@kernel.org>,
	"A. Wilcox" <AWilcox@Wilcox-Tech.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/5] mips: kvm: drop support for 32-bit hosts
Date: Sat, 21 Dec 2024 22:42:19 +0100
Message-Id: <20241221214223.3046298-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241221214223.3046298-1-arnd@kernel.org>
References: <20241221214223.3046298-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_134907_302097_3C5DBFDA 
X-CRM114-Status: GOOD (  18.95  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

KVM support on MIPS was added in 2012 with both 32-bit and 64-bit mode
included, but there is only one CPU implementation that actually includes
the required VZ support with the Warrior P5600 core. Support for the
one SoC using this core did not fully get merged into mainline, and
very likely never will.

Simplify the KVM code by dropping the corresponding #ifdef checks for
32-bit mode, leaving only 64-bit mode available in Loongson, Cavium,
Mobileye and Fungible SoCs.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/Kconfig                |  3 ---
 arch/mips/include/asm/kvm_host.h |  4 ----
 arch/mips/kvm/Kconfig            |  1 +
 arch/mips/kvm/emulate.c          |  8 --------
 arch/mips/kvm/msa.S              | 12 ------------
 arch/mips/kvm/vz.c               | 22 ----------------------
 6 files changed, 1 insertion(+), 49 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a33f05e1ad6d..7705d634d9c7 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1415,7 +1415,6 @@ config CPU_MIPS32_R5
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_MSA
-	select CPU_SUPPORTS_VZ
 	select MIPS_O32_FP64_SUPPORT
 	help
 	  Choose this option to build a kernel for release 5 or later of the
@@ -1431,7 +1430,6 @@ config CPU_MIPS32_R6
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_MSA
-	select CPU_SUPPORTS_VZ
 	select MIPS_O32_FP64_SUPPORT
 	help
 	  Choose this option to build a kernel for release 6 or later of the
@@ -1517,7 +1515,6 @@ config CPU_P5600
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_MSA
 	select CPU_SUPPORTS_CPUFREQ
-	select CPU_SUPPORTS_VZ
 	select CPU_MIPSR2_IRQ_VI
 	select CPU_MIPSR2_IRQ_EI
 	select MIPS_O32_FP64_SUPPORT
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index f7222eb594ea..1a506892322d 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -261,11 +261,7 @@ enum emulation_result {
 	EMULATE_HYPERCALL,	/* HYPCALL instruction */
 };
 
-#if defined(CONFIG_64BIT)
 #define VPN2_MASK		GENMASK(cpu_vmbits - 1, 13)
-#else
-#define VPN2_MASK		0xffffe000
-#endif
 #define KVM_ENTRYHI_ASID	cpu_asid_mask(&boot_cpu_data)
 #define TLB_IS_GLOBAL(x)	((x).tlb_lo[0] & (x).tlb_lo[1] & ENTRYLO_G)
 #define TLB_VPN2(x)		((x).tlb_hi & VPN2_MASK)
diff --git a/arch/mips/kvm/Kconfig b/arch/mips/kvm/Kconfig
index ab57221fa4dd..2508ebbf49ba 100644
--- a/arch/mips/kvm/Kconfig
+++ b/arch/mips/kvm/Kconfig
@@ -18,6 +18,7 @@ if VIRTUALIZATION
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support"
 	depends on CPU_SUPPORTS_VZ
+	depends on 64BIT
 	depends on MIPS_FP_SUPPORT
 	select EXPORT_UASM
 	select KVM_COMMON
diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index 0feec52222fb..c84eaf21643c 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -994,7 +994,6 @@ enum emulation_result kvm_mips_emulate_store(union mips_instruction inst,
 		goto out_fail;
 
 	switch (inst.i_format.opcode) {
-#if defined(CONFIG_64BIT)
 	case sd_op:
 		run->mmio.len = 8;
 		*(u64 *)data = vcpu->arch.gprs[rt];
@@ -1003,7 +1002,6 @@ enum emulation_result kvm_mips_emulate_store(union mips_instruction inst,
 			  vcpu->arch.pc, vcpu->arch.host_cp0_badvaddr,
 			  vcpu->arch.gprs[rt], *(u64 *)data);
 		break;
-#endif
 
 	case sw_op:
 		run->mmio.len = 4;
@@ -1092,7 +1090,6 @@ enum emulation_result kvm_mips_emulate_store(union mips_instruction inst,
 			  vcpu->arch.gprs[rt], *(u32 *)data);
 		break;
 
-#if defined(CONFIG_64BIT)
 	case sdl_op:
 		run->mmio.phys_addr = kvm_mips_callbacks->gva_to_gpa(
 					vcpu->arch.host_cp0_badvaddr) & (~0x7);
@@ -1186,7 +1183,6 @@ enum emulation_result kvm_mips_emulate_store(union mips_instruction inst,
 			  vcpu->arch.pc, vcpu->arch.host_cp0_badvaddr,
 			  vcpu->arch.gprs[rt], *(u64 *)data);
 		break;
-#endif
 
 #ifdef CONFIG_CPU_LOONGSON64
 	case sdc2_op:
@@ -1299,7 +1295,6 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
 
 	vcpu->mmio_needed = 2;	/* signed */
 	switch (op) {
-#if defined(CONFIG_64BIT)
 	case ld_op:
 		run->mmio.len = 8;
 		break;
@@ -1307,7 +1302,6 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
 	case lwu_op:
 		vcpu->mmio_needed = 1;	/* unsigned */
 		fallthrough;
-#endif
 	case lw_op:
 		run->mmio.len = 4;
 		break;
@@ -1374,7 +1368,6 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
 		}
 		break;
 
-#if defined(CONFIG_64BIT)
 	case ldl_op:
 		run->mmio.phys_addr = kvm_mips_callbacks->gva_to_gpa(
 					vcpu->arch.host_cp0_badvaddr) & (~0x7);
@@ -1446,7 +1439,6 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
 			break;
 		}
 		break;
-#endif
 
 #ifdef CONFIG_CPU_LOONGSON64
 	case ldc2_op:
diff --git a/arch/mips/kvm/msa.S b/arch/mips/kvm/msa.S
index d02f0c6cc2cc..c73858efb975 100644
--- a/arch/mips/kvm/msa.S
+++ b/arch/mips/kvm/msa.S
@@ -93,20 +93,8 @@ LEAF(__kvm_restore_msa)
 	.macro	kvm_restore_msa_upper	wr, off, base
 	.set	push
 	.set	noat
-#ifdef CONFIG_64BIT
 	ld	$1, \off(\base)
 	insert_d \wr, 1
-#elif defined(CONFIG_CPU_LITTLE_ENDIAN)
-	lw	$1, \off(\base)
-	insert_w \wr, 2
-	lw	$1, (\off+4)(\base)
-	insert_w \wr, 3
-#else /* CONFIG_CPU_BIG_ENDIAN */
-	lw	$1, (\off+4)(\base)
-	insert_w \wr, 2
-	lw	$1, \off(\base)
-	insert_w \wr, 3
-#endif
 	.set	pop
 	.endm
 
diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
index ccab4d76b126..b376ac870256 100644
--- a/arch/mips/kvm/vz.c
+++ b/arch/mips/kvm/vz.c
@@ -746,7 +746,6 @@ static int kvm_vz_gva_to_gpa(struct kvm_vcpu *vcpu, unsigned long gva,
 			*gpa = gva32 & 0x1fffffff;
 			return 0;
 		}
-#ifdef CONFIG_64BIT
 	} else if ((gva & 0xc000000000000000) == 0x8000000000000000) {
 		/* XKPHYS */
 		if (cpu_guest_has_segments) {
@@ -771,7 +770,6 @@ static int kvm_vz_gva_to_gpa(struct kvm_vcpu *vcpu, unsigned long gva,
 		 */
 		*gpa = gva & 0x07ffffffffffffff;
 		return 0;
-#endif
 	}
 
 tlb_mapped:
@@ -1740,9 +1738,7 @@ static u64 kvm_vz_get_one_regs[] = {
 	KVM_REG_MIPS_CP0_CONFIG4,
 	KVM_REG_MIPS_CP0_CONFIG5,
 	KVM_REG_MIPS_CP0_CONFIG6,
-#ifdef CONFIG_64BIT
 	KVM_REG_MIPS_CP0_XCONTEXT,
-#endif
 	KVM_REG_MIPS_CP0_ERROREPC,
 
 	KVM_REG_MIPS_COUNT_CTL,
@@ -1752,9 +1748,7 @@ static u64 kvm_vz_get_one_regs[] = {
 
 static u64 kvm_vz_get_one_regs_contextconfig[] = {
 	KVM_REG_MIPS_CP0_CONTEXTCONFIG,
-#ifdef CONFIG_64BIT
 	KVM_REG_MIPS_CP0_XCONTEXTCONFIG,
-#endif
 };
 
 static u64 kvm_vz_get_one_regs_segments[] = {
@@ -1937,13 +1931,11 @@ static int kvm_vz_get_one_reg(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		*v = read_gc0_userlocal();
 		break;
-#ifdef CONFIG_64BIT
 	case KVM_REG_MIPS_CP0_XCONTEXTCONFIG:
 		if (!cpu_guest_has_contextconfig)
 			return -EINVAL;
 		*v = read_gc0_xcontextconfig();
 		break;
-#endif
 	case KVM_REG_MIPS_CP0_PAGEMASK:
 		*v = (long)read_gc0_pagemask();
 		break;
@@ -2083,11 +2075,9 @@ static int kvm_vz_get_one_reg(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		*v = kvm_read_sw_gc0_maari(&vcpu->arch.cop0);
 		break;
-#ifdef CONFIG_64BIT
 	case KVM_REG_MIPS_CP0_XCONTEXT:
 		*v = read_gc0_xcontext();
 		break;
-#endif
 	case KVM_REG_MIPS_CP0_ERROREPC:
 		*v = (long)read_gc0_errorepc();
 		break;
@@ -2163,13 +2153,11 @@ static int kvm_vz_set_one_reg(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		write_gc0_userlocal(v);
 		break;
-#ifdef CONFIG_64BIT
 	case KVM_REG_MIPS_CP0_XCONTEXTCONFIG:
 		if (!cpu_guest_has_contextconfig)
 			return -EINVAL;
 		write_gc0_xcontextconfig(v);
 		break;
-#endif
 	case KVM_REG_MIPS_CP0_PAGEMASK:
 		write_gc0_pagemask(v);
 		break;
@@ -2360,11 +2348,9 @@ static int kvm_vz_set_one_reg(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		kvm_write_maari(vcpu, v);
 		break;
-#ifdef CONFIG_64BIT
 	case KVM_REG_MIPS_CP0_XCONTEXT:
 		write_gc0_xcontext(v);
 		break;
-#endif
 	case KVM_REG_MIPS_CP0_ERROREPC:
 		write_gc0_errorepc(v);
 		break;
@@ -2632,11 +2618,9 @@ static int kvm_vz_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	kvm_restore_gc0_context(cop0);
 	if (cpu_guest_has_contextconfig)
 		kvm_restore_gc0_contextconfig(cop0);
-#ifdef CONFIG_64BIT
 	kvm_restore_gc0_xcontext(cop0);
 	if (cpu_guest_has_contextconfig)
 		kvm_restore_gc0_xcontextconfig(cop0);
-#endif
 	kvm_restore_gc0_pagemask(cop0);
 	kvm_restore_gc0_pagegrain(cop0);
 	kvm_restore_gc0_hwrena(cop0);
@@ -2717,11 +2701,9 @@ static int kvm_vz_vcpu_put(struct kvm_vcpu *vcpu, int cpu)
 	kvm_save_gc0_context(cop0);
 	if (cpu_guest_has_contextconfig)
 		kvm_save_gc0_contextconfig(cop0);
-#ifdef CONFIG_64BIT
 	kvm_save_gc0_xcontext(cop0);
 	if (cpu_guest_has_contextconfig)
 		kvm_save_gc0_xcontextconfig(cop0);
-#endif
 	kvm_save_gc0_pagemask(cop0);
 	kvm_save_gc0_pagegrain(cop0);
 	kvm_save_gc0_wired(cop0);
@@ -3030,12 +3012,10 @@ static int kvm_vz_check_extension(struct kvm *kvm, long ext)
 		/* we wouldn't be here unless cpu_has_vz */
 		r = 1;
 		break;
-#ifdef CONFIG_64BIT
 	case KVM_CAP_MIPS_64BIT:
 		/* We support 64-bit registers/operations and addresses */
 		r = 2;
 		break;
-#endif
 	case KVM_CAP_IOEVENTFD:
 		r = 1;
 		break;
@@ -3179,12 +3159,10 @@ static int kvm_vz_vcpu_setup(struct kvm_vcpu *vcpu)
 	if (cpu_guest_has_contextconfig) {
 		/* ContextConfig */
 		kvm_write_sw_gc0_contextconfig(cop0, 0x007ffff0);
-#ifdef CONFIG_64BIT
 		/* XContextConfig */
 		/* bits SEGBITS-13+3:4 set */
 		kvm_write_sw_gc0_xcontextconfig(cop0,
 					((1ull << (cpu_vmbits - 13)) - 1) << 4);
-#endif
 	}
 
 	/* Implementation dependent, use the legacy layout */
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
