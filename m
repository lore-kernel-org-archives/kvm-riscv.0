Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A67C369D9
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 07:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPcTtHL/G9zDGNy+L2c51Y/VtfIrVkO/jnnJZxJ4Go8=; b=CCXbFfL96p5pcz
	XHT8N/XbmhoV6vKHarP4vPpvF1eSzyzsizyyQw1bZx7N8VA9Na7sBbsMiqAJ0CLGhAUGuzHamV1P1
	zfvC+/BvXe/HlaR5TC7u2/FZUuDn+PuNyy+Ve4iMV0m8sHA5GFQ7xL3MMkrxIwFCnEwtP2QXh56RZ
	cLL93GmJyRzMg5Tay3j2EyNACKmTvj249KvJMoMj8WYa3BTluzA1Y/oxBqvgd38gzZJbaPqP2GfPq
	dxIRwC8LFBsq1WhEqyDNWSgMcwSbRyh7VAfAT1JDO1S8eLRwyomsuup33AaWi/S6i6Go/vU92fZbC
	57w2K326BrKuPfUzeang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1Vg-0000000BwCQ-3rLO;
	Wed, 30 Apr 2025 07:05:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1Vd-0000000BwAq-2BFG
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 07:05:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso43496745e9.0
        for <kvm-riscv@lists.infradead.org>; Wed, 30 Apr 2025 00:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745996731; x=1746601531; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SVvfYimiPZS6cg4U084sfnLSo48so/ncOUQmetF/XDo=;
        b=Xj7vP+pGFgTGdC52uYqxq3iMaBfRmhidgRuHNvjehVZYauUnX+5oxjZNuSVz75BdUm
         wHA6wC0S4J1dWLSw7Otv7BsrdIlKBoDGzqTqfOcp3dve8Vb6wSPKa2WLdlxHBDhe2fTa
         edNu/X2WuvwCzRlvJ+eKk9r0z3jPSvTVMQ30gdxxzB/WNoQeX19ikJSmTBSiDm1V94SN
         gUPBZL0nGFkHbNV84wY10keppGU2ntPg1gRk+E+enttWXnK3kOxjrIV7RgoOX2Q7Y21E
         RHFjX0PSu57G5qLZzsAE74XW08Ay40zxKT28pAp9kWL8La5WrDcfe8B86qrWGJO0WgJ3
         KStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996731; x=1746601531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVvfYimiPZS6cg4U084sfnLSo48so/ncOUQmetF/XDo=;
        b=sycPHkU1NY1mdVSELlaaHGL1A0jSEajPf3QlYBzybq6M59gmRc6UM0oeALH89KZv5A
         TULHX3MySim/QiNe1fNTqtU0weLB4jWahVT0O3lmf+htKILYUrZYDtKxzs72oHqEVda/
         NGoqEFaGvhh7q2YVYQUFreZM2Rzq6ErA4xaVUuUw68RyVYCwq6wI4eCm3ABG7suBrOZa
         U2uBUAqEtucfTbzCj2VaXLqg8KVUzsBziv6Qej3Ok34wgxw9FHXa1h78+pu0ClNrmAuX
         7bzwPeOuLZXS9OQs9h79jD7upS3qZybt4EJVdJhQKS5yR9HMFJPFmEouQMpdii0NWF08
         DPUg==
X-Forwarded-Encrypted: i=1; AJvYcCU/m2wPBi3nDuJnHdZhKAR4Vsj249ztmGl6RlothCwtM/MQ0qqL88khpiC3YamdbEwbVMcjCTgzTTk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHA0RxgfdzVRRM/Di23y8bP3+obl/I3fN2SbN02mtCVfbsnwry
	FMOdOxgHOBbV7Lz30jhW+8oc9OJRBqm8qj6/YA6ILW8ZichAsdwgMUWJt3oiHsc=
X-Gm-Gg: ASbGncuFkq6+4EeTgshWKsuRPW6Ty/tqMhbdIzhRK7Lrz4H8GgyNJRr7O9ELsosKI47
	R70C1YMIJDvlHjP676fbY40iXYWfX20/HX5QBpUeFBkcZIUFMUoVlzP3AB4aVufpHmGK92yKruT
	2u20GnjrxxFYB27TOj8OtAn9bzW0DA9ck3y/IrK0iHGzn3QUgRM3nc6ksZQtEV7eyWahTjjqT6o
	f0NU6gvO9QOQAPfnj7wMBEZSjvjIKG056IkVg+vtLz/4Hwg7+jWnwav+NuZK5X/J8uUNqMB0o0q
	pcRvfZ9T6zF8l4tqDPmdyUqsBwSZ
X-Google-Smtp-Source: AGHT+IEdF7Ranbsc/bcaoboCh6IHK4P6VnQG9MxQM+0axTJmPOKs4W5R61X+N8DpwJd52q+rA2++PA==
X-Received: by 2002:a05:600c:1d91:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-441b1f35e37mr18239195e9.14.1745996731411;
        Wed, 30 Apr 2025 00:05:31 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2bbc0a2sm13050305e9.30.2025.04.30.00.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:05:30 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:05:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] KVM: riscv: selftests: Align the trap information
 wiht pt_regs
Message-ID: <20250430-92907020fba3f6ee328e821d@orel>
References: <20250429-kvm_selftest_improve-v2-0-51713f91e04a@rivosinc.com>
 <20250429-kvm_selftest_improve-v2-1-51713f91e04a@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250429-kvm_selftest_improve-v2-1-51713f91e04a@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_000533_556570_2DFD1BFA 
X-CRM114-Status: GOOD (  21.05  )
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

On Tue, Apr 29, 2025 at 05:18:45PM -0700, Atish Patra wrote:
> The current exeception register structure in selftests are missing
> few registers (e.g stval). Instead of adding it manually, change
> the ex_regs to align with pt_regs to make it future proof.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../selftests/kvm/include/riscv/processor.h        |  10 +-
>  tools/testing/selftests/kvm/lib/riscv/handlers.S   | 164 ++++++++++++---------
>  tools/testing/selftests/kvm/lib/riscv/processor.c  |   2 +-
>  tools/testing/selftests/kvm/riscv/arch_timer.c     |   2 +-
>  tools/testing/selftests/kvm/riscv/ebreak_test.c    |   2 +-
>  tools/testing/selftests/kvm/riscv/sbi_pmu_test.c   |   4 +-
>  6 files changed, 104 insertions(+), 80 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 5f389166338c..1b5aef87de0f 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -60,7 +60,8 @@ static inline bool __vcpu_has_sbi_ext(struct kvm_vcpu *vcpu, uint64_t sbi_ext)
>  	return __vcpu_has_ext(vcpu, RISCV_SBI_EXT_REG(sbi_ext));
>  }
>  
> -struct ex_regs {
> +struct pt_regs {
> +	unsigned long epc;
>  	unsigned long ra;
>  	unsigned long sp;
>  	unsigned long gp;
> @@ -92,16 +93,19 @@ struct ex_regs {
>  	unsigned long t4;
>  	unsigned long t5;
>  	unsigned long t6;
> -	unsigned long epc;
> +	/* Supervisor/Machine CSRs */
>  	unsigned long status;
> +	unsigned long badaddr;
>  	unsigned long cause;
> +	/* a0 value before the syscall */
> +	unsigned long orig_a0;
>  };
>  
>  #define NR_VECTORS  2
>  #define NR_EXCEPTIONS  32
>  #define EC_MASK  (NR_EXCEPTIONS - 1)
>  
> -typedef void(*exception_handler_fn)(struct ex_regs *);
> +typedef void(*exception_handler_fn)(struct pt_regs *);
>  
>  void vm_init_vector_tables(struct kvm_vm *vm);
>  void vcpu_init_vector_tables(struct kvm_vcpu *vcpu);
> diff --git a/tools/testing/selftests/kvm/lib/riscv/handlers.S b/tools/testing/selftests/kvm/lib/riscv/handlers.S
> index aa0abd3f35bb..9c99b258cae7 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/handlers.S
> +++ b/tools/testing/selftests/kvm/lib/riscv/handlers.S
> @@ -9,86 +9,106 @@
>  
>  #include <asm/csr.h>
>  
> +#ifdef __ASSEMBLY__
> +#define __ASM_STR(x)	x
> +#else
> +#define __ASM_STR(x)	#x
> +#endif

We should always have __ASSEMBLY__ (or actually __ASSMEBLER__) defined
when compiling this .S file.

> +
> +#if __riscv_xlen == 64
> +#define __REG_SEL(a, b)	__ASM_STR(a)
> +#elif __riscv_xlen == 32
> +#define __REG_SEL(a, b)	__ASM_STR(b)
> +#else
> +#error "Unexpected __riscv_xlen"
> +#endif
> +
> +#define REG_L		__REG_SEL(ld, lw)
> +#define REG_S		__REG_SEL(sd, sw)

We don't need these macros since we only support 64-bit. We always
have -DCONFIG_64BIT appended to CFLAGS. But it doesn't hurt to
have them either...

> +
>  .macro save_context
> -	addi  sp, sp, (-8*34)
> -	sd    x1, 0(sp)
> -	sd    x2, 8(sp)
> -	sd    x3, 16(sp)
> -	sd    x4, 24(sp)
> -	sd    x5, 32(sp)
> -	sd    x6, 40(sp)
> -	sd    x7, 48(sp)
> -	sd    x8, 56(sp)
> -	sd    x9, 64(sp)
> -	sd    x10, 72(sp)
> -	sd    x11, 80(sp)
> -	sd    x12, 88(sp)
> -	sd    x13, 96(sp)
> -	sd    x14, 104(sp)
> -	sd    x15, 112(sp)
> -	sd    x16, 120(sp)
> -	sd    x17, 128(sp)
> -	sd    x18, 136(sp)
> -	sd    x19, 144(sp)
> -	sd    x20, 152(sp)
> -	sd    x21, 160(sp)
> -	sd    x22, 168(sp)
> -	sd    x23, 176(sp)
> -	sd    x24, 184(sp)
> -	sd    x25, 192(sp)
> -	sd    x26, 200(sp)
> -	sd    x27, 208(sp)
> -	sd    x28, 216(sp)
> -	sd    x29, 224(sp)
> -	sd    x30, 232(sp)
> -	sd    x31, 240(sp)
> +	addi  sp, sp, (-8*36)
> +	REG_S    x1, 8(sp)
> +	REG_S    x2, 16(sp)
> +	REG_S    x3, 24(sp)
> +	REG_S    x4, 32(sp)
> +	REG_S    x5, 40(sp)
> +	REG_S    x6, 48(sp)
> +	REG_S    x7, 56(sp)
> +	REG_S    x8, 64(sp)
> +	REG_S    x9, 72(sp)
> +	REG_S    x10, 80(sp)
> +	REG_S    x11, 88(sp)
> +	REG_S    x12, 96(sp)
> +	REG_S    x13, 104(sp)
> +	REG_S    x14, 112(sp)
> +	REG_S    x15, 120(sp)
> +	REG_S    x16, 128(sp)
> +	REG_S    x17, 136(sp)
> +	REG_S    x18, 144(sp)
> +	REG_S    x19, 152(sp)
> +	REG_S    x20, 160(sp)
> +	REG_S    x21, 168(sp)
> +	REG_S    x22, 176(sp)
> +	REG_S    x23, 184(sp)
> +	REG_S    x24, 192(sp)
> +	REG_S    x25, 200(sp)
> +	REG_S    x26, 208(sp)
> +	REG_S    x27, 216(sp)
> +	REG_S    x28, 224(sp)
> +	REG_S    x29, 232(sp)
> +	REG_S    x30, 240(sp)
> +	REG_S    x31, 248(sp)
>  	csrr  s0, CSR_SEPC
>  	csrr  s1, CSR_SSTATUS
> -	csrr  s2, CSR_SCAUSE
> -	sd    s0, 248(sp)
> -	sd    s1, 256(sp)
> -	sd    s2, 264(sp)
> +	csrr  s2, CSR_STVAL
> +	csrr  s3, CSR_SCAUSE
> +	REG_S    s0, 0(sp)
> +	REG_S    s1, 256(sp)
> +	REG_S    s2, 264(sp)
> +	REG_S    s3, 272(sp)
>  .endm
>  
>  .macro restore_context
> -	ld    s2, 264(sp)
> -	ld    s1, 256(sp)
> -	ld    s0, 248(sp)
> -	csrw  CSR_SCAUSE, s2
> +	REG_L    s3, 272(sp)
> +	REG_L    s2, 264(sp)
> +	REG_L    s1, 256(sp)
> +	REG_L    s0, 0(sp)
> +	csrw  CSR_SCAUSE, s3
>  	csrw  CSR_SSTATUS, s1
>  	csrw  CSR_SEPC, s0
> -	ld    x31, 240(sp)
> -	ld    x30, 232(sp)
> -	ld    x29, 224(sp)
> -	ld    x28, 216(sp)
> -	ld    x27, 208(sp)
> -	ld    x26, 200(sp)
> -	ld    x25, 192(sp)
> -	ld    x24, 184(sp)
> -	ld    x23, 176(sp)
> -	ld    x22, 168(sp)
> -	ld    x21, 160(sp)
> -	ld    x20, 152(sp)
> -	ld    x19, 144(sp)
> -	ld    x18, 136(sp)
> -	ld    x17, 128(sp)
> -	ld    x16, 120(sp)
> -	ld    x15, 112(sp)
> -	ld    x14, 104(sp)
> -	ld    x13, 96(sp)
> -	ld    x12, 88(sp)
> -	ld    x11, 80(sp)
> -	ld    x10, 72(sp)
> -	ld    x9, 64(sp)
> -	ld    x8, 56(sp)
> -	ld    x7, 48(sp)
> -	ld    x6, 40(sp)
> -	ld    x5, 32(sp)
> -	ld    x4, 24(sp)
> -	ld    x3, 16(sp)
> -	ld    x2, 8(sp)
> -	ld    x1, 0(sp)
> -	addi  sp, sp, (8*34)
> +	REG_L    x31, 248(sp)
> +	REG_L    x30, 240(sp)
> +	REG_L    x29, 232(sp)
> +	REG_L    x28, 224(sp)
> +	REG_L    x27, 216(sp)
> +	REG_L    x26, 208(sp)
> +	REG_L    x25, 200(sp)
> +	REG_L    x24, 192(sp)
> +	REG_L    x23, 184(sp)
> +	REG_L    x22, 176(sp)
> +	REG_L    x21, 168(sp)
> +	REG_L    x20, 160(sp)
> +	REG_L    x19, 152(sp)
> +	REG_L    x18, 144(sp)
> +	REG_L    x17, 136(sp)
> +	REG_L    x16, 128(sp)
> +	REG_L    x15, 120(sp)
> +	REG_L    x14, 112(sp)
> +	REG_L    x13, 104(sp)
> +	REG_L    x12, 96(sp)
> +	REG_L    x11, 88(sp)
> +	REG_L    x10, 80(sp)
> +	REG_L    x9, 72(sp)
> +	REG_L    x8, 64(sp)
> +	REG_L    x7, 56(sp)
> +	REG_L    x6, 48(sp)
> +	REG_L    x5, 40(sp)
> +	REG_L    x4, 32(sp)
> +	REG_L    x3, 24(sp)
> +	REG_L    x2, 16(sp)
> +	REG_L    x1, 8(sp)
> +	addi  sp, sp, (8*36)
>  .endm
>  
>  .balign 4
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index dd663bcf0cc0..2eac7d4b59e9 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -402,7 +402,7 @@ struct handlers {
>  	exception_handler_fn exception_handlers[NR_VECTORS][NR_EXCEPTIONS];
>  };
>  
> -void route_exception(struct ex_regs *regs)
> +void route_exception(struct pt_regs *regs)
>  {
>  	struct handlers *handlers = (struct handlers *)exception_handlers;
>  	int vector = 0, ec;
> diff --git a/tools/testing/selftests/kvm/riscv/arch_timer.c b/tools/testing/selftests/kvm/riscv/arch_timer.c
> index 9e370800a6a2..f962fefc48fa 100644
> --- a/tools/testing/selftests/kvm/riscv/arch_timer.c
> +++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
> @@ -15,7 +15,7 @@
>  
>  static int timer_irq = IRQ_S_TIMER;
>  
> -static void guest_irq_handler(struct ex_regs *regs)
> +static void guest_irq_handler(struct pt_regs *regs)
>  {
>  	uint64_t xcnt, xcnt_diff_us, cmp;
>  	unsigned int intid = regs->cause & ~CAUSE_IRQ_FLAG;
> diff --git a/tools/testing/selftests/kvm/riscv/ebreak_test.c b/tools/testing/selftests/kvm/riscv/ebreak_test.c
> index cfed6c727bfc..739d17befb5a 100644
> --- a/tools/testing/selftests/kvm/riscv/ebreak_test.c
> +++ b/tools/testing/selftests/kvm/riscv/ebreak_test.c
> @@ -27,7 +27,7 @@ static void guest_code(void)
>  	GUEST_DONE();
>  }
>  
> -static void guest_breakpoint_handler(struct ex_regs *regs)
> +static void guest_breakpoint_handler(struct pt_regs *regs)
>  {
>  	WRITE_ONCE(sw_bp_addr, regs->epc);
>  	regs->epc += 4;
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 03406de4989d..6e66833e5941 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -128,7 +128,7 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
>  		       "Unable to stop counter %ld error %ld\n", counter, ret.error);
>  }
>  
> -static void guest_illegal_exception_handler(struct ex_regs *regs)
> +static void guest_illegal_exception_handler(struct pt_regs *regs)
>  {
>  	__GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
>  		       "Unexpected exception handler %lx\n", regs->cause);
> @@ -138,7 +138,7 @@ static void guest_illegal_exception_handler(struct ex_regs *regs)
>  	regs->epc += 4;
>  }
>  
> -static void guest_irq_handler(struct ex_regs *regs)
> +static void guest_irq_handler(struct pt_regs *regs)
>  {
>  	unsigned int irq_num = regs->cause & ~CAUSE_IRQ_FLAG;
>  	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
> 
> -- 
> 2.43.0
>

Other than the macro comments,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
