Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4BFCCD195
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIIb/WG5TcTpB6srpZIBzEAF9xxlhh5hOBQWvCudBZg=; b=wgswdeY6b/tjoj
	EvpaGtd4DQF0EU/naDTcRIDPr9oLpysOEkGXibKMr8mFFpfaxZNSPab8g7yVmoFAkw748XQ+AK3ij
	BL8w/4B6Nh6roZQQWYkQJO+9vqrRIud7+DB7I8iGFe3VJ0nFnUribUP6PyNZolkg8xzA0a2oN52Wk
	fmV8s0oWwLwEPEJoHoEIU9bTw9tRuxOlQvIU8h3wF9UPbW2/b+fIJ07jomR2NcJDpderJP9KGUfEg
	DZ6AnFpN9DYOyg2+biulUXRwMwuSZlEWLnoCjcDcq9rH/luuhDV0OJkSp7i+Zp9ucXPT8med2BPPt
	RdHQEFQQUxsjn/oMtzug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mXL-00000008Igq-2CxG;
	Fri, 17 Oct 2025 15:38:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mXK-00000008IgJ-1b9a
	for kvm-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 15:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3IkiaFPWEUleUNiTyk/9xT7JY/1Dmn3W+S6DuXwxsWA=; b=dF22RZ8dM0f9oFpaDbLUwHlg0j
	HLJ04hmKt+Lo9MXgTDVkLBe8ul+2vPGCX0R/MQ6b6O7d0CN3Q7qBTOOMFQny3dvDUsBIwsAsuDVcX
	BvLZs1KNxRdV0dBiu2YxcwzvOwze/Z80aVffApyQN7NzwvB3Xiu3H5eoCqb6CFKZd92C25Qe1q0xC
	ShvqZ20TrOQtLR5m0cbzGH/RB0B0JTTcZAJymkSaed5A2TDiutsKwQqr9q5I0xhXtBerqnCeToOqh
	vISJ3tpnj7O+K0+VQObnfLVU/oXgumqOmGkF/oPkQtvSSZ+l7qQTc47Z8pNUeCmcPu4YmLnORbIXI
	lj9AfFiQ==;
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mXG-00000007gtr-1NY5
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 15:38:33 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-42e2c336adcso8733735ab.1
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Oct 2025 08:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760715506; x=1761320306; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3IkiaFPWEUleUNiTyk/9xT7JY/1Dmn3W+S6DuXwxsWA=;
        b=fm9DETf+7SC9Ye3mkC8VAMzGMRtR2SGFaM+dhqthDG6PVQjutqUQbRecCTUJh9dZru
         Elo1fn601e2O2GceafCg/NNKZblFruzoHDQQRwcge2W8/c1ATAFH15zt+OlvfKsksolV
         prgis3cziRyUq9JklJC0q0GKJXiTmJip+GUJ7s+U+vsCY5uguLhA03dVA6E1Yh4Pnxwm
         P/Mbt2PFwrJSTRpm6iGDCPXe/RQEp4SF7G9a386bBTxtTVFx+84nsOcQoUn7pNNWlg+R
         wZW8fgL5C/bByiPB5xp3p54EmwYNrHrXjejz65wxu3bvuvuoXJTh82nhGw64m/pQuhcy
         6Btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760715506; x=1761320306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IkiaFPWEUleUNiTyk/9xT7JY/1Dmn3W+S6DuXwxsWA=;
        b=v8QMi8pvTFFtOuzngu0ycyOsoXJsyMAqFjOoffkH8aypn4sfPLroBuP03i8C5Rz2Yr
         gGQ1ogrXlKur1aC2J8vjT/ZN/YOYr6GJEZqAZh2DLtnfhW/aOdozbIiCjz/mSmh6+SGR
         O2JNZlx2jvKg1ql+1PM/7RqZ9mz0uqjl/lw2JK8b0KhzKp63XU7YDhTcgUD/Z5dFRj+y
         K7XlMhcAX7dyN0ihgxFpwp0g6NDiMcrcY9aUcKWSAL/JY9iKTL/ejLhYRnF/xDk0DVrI
         KjDWt0ud2GdG0bPUaB61mfdsJ1BvgvxM45yAV/CiWqybi0KFv1btENI0nXb8A72n4lHT
         kgMA==
X-Gm-Message-State: AOJu0Yzjhj6TWmyT5AsIq1ljWJ4VarVAagETIDV9ZrlcVlXr7GFd3w6X
	5MGpruF3KSltmycpCMIUHbK8QvFLmwCwDNmeoy/3DwyFM2ht06SU5b34n9bmOyLwqcw=
X-Gm-Gg: ASbGncvByih6CzNzSXRgGRHpBAdn8blG0YwMwM+HsI0WCd6gXSr+CpqgPRgJayamulB
	iU8JU9Qd6YlUkfto5pSA0OsIUspJde8tgffL+PdaMGh7cPOTXV8a9zA+hlHGG+DThT6Y6Q/gaF4
	b9NZyVCrVVsaVnSLTygppS2ovpPNi0RwDuLCjey8cDl/cSSZs7GR++vSVW5u+o9YpsssSFmiNX9
	V8h6cRkWRqUzNyUr8q0aEQkp3fCOfrFjzAE7/1jJgMGPxlYMS/uTtM357oDHq+N0vpRktrSg3bY
	rxmMhXzbLwrzWNT4c/Kpnm2jbd2MvQrbakYvW0ecVsR6Yk44ZJfyRCskqQK739tt0CBBPQQsqgM
	M/XaHHyhuGQKYD83z0Sgy9gGbOERLWovbxqN5UvblvpXV4OL7L1kjyF3mfn6otgfOy6GNIlFwg8
	i37A==
X-Google-Smtp-Source: AGHT+IEOeL9RYt2n7R5NBodeI/kP84Ydx/RE3L47B5OiYevmtA3rUY09Rr9t75Vult8CZic7zlIE6g==
X-Received: by 2002:a05:6e02:1fcf:b0:430:c17c:5082 with SMTP id e9e14a558f8ab-430c5203fa5mr67289025ab.6.1760715506048;
        Fri, 17 Oct 2025 08:38:26 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a76f70b81asm911347173.46.2025.10.17.08.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:38:25 -0700 (PDT)
Date: Fri, 17 Oct 2025 10:38:24 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: wu.fei9@sanechips.com.cn
Cc: kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] KVM: riscv: selftests: Add riscv vm satp modes
Message-ID: <20251017-a54df6d42b219d16a24a26ea@orel>
References: <20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn>
 <202510170334.59H3Y7fB074149@mse-fl2.zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202510170334.59H3Y7fB074149@mse-fl2.zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_163830_536525_B2F536BA 
X-CRM114-Status: GOOD (  21.60  )
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

On Fri, Oct 17, 2025 at 11:13:33AM +0800, wu.fei9@sanechips.com.cn wrote:
> Current vm modes cannot represent riscv guest modes precisely, here add
> P41V39, P50V48 and P56V57.
> 
> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
> ---
>  .../testing/selftests/kvm/include/kvm_util.h  |  7 ++++++-
>  tools/testing/selftests/kvm/lib/guest_modes.c |  7 +++----
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 15 +++++++++++++
>  .../selftests/kvm/lib/riscv/processor.c       | 21 +++++++++++++++----
>  4 files changed, 41 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index bee65ca08721..02224bc514d4 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -179,6 +179,11 @@ enum vm_guest_mode {
>         VM_MODE_P36V48_64K,
>         VM_MODE_P47V47_16K,
>         VM_MODE_P36V47_16K,
> +
> +       VM_MODE_P56V57_4K,      /* For riscv64 */

This should be P59

> +       VM_MODE_P50V48_4K,
> +       VM_MODE_P41V39_4K,
> +
>         NUM_VM_MODES,
>  };
> 
> @@ -229,7 +234,7 @@ extern enum vm_guest_mode vm_mode_default;
>  #error "RISC-V 32-bit kvm selftests not supported"
>  #endif
> 
> -#define VM_MODE_DEFAULT                        VM_MODE_P40V48_4K
> +#define VM_MODE_DEFAULT                        VM_MODE_P50V48_4K
>  #define MIN_PAGE_SHIFT                 12U
>  #define ptes_per_page(page_size)       ((page_size) / 8)
> 
> diff --git a/tools/testing/selftests/kvm/lib/guest_modes.c b/tools/testing/selftests/kvm/lib/guest_modes.c
> index b04901e55138..63d0d5479188 100644
> --- a/tools/testing/selftests/kvm/lib/guest_modes.c
> +++ b/tools/testing/selftests/kvm/lib/guest_modes.c
> @@ -75,10 +75,9 @@ void guest_modes_append_default(void)
>         {
>                 unsigned int sz = kvm_check_cap(KVM_CAP_VM_GPA_BITS);
> 
> -               if (sz >= 52)
> -                       guest_mode_append(VM_MODE_P52V48_4K, true);
> -               if (sz >= 48)
> -                       guest_mode_append(VM_MODE_P48V48_4K, true);
> +               guest_mode_append(VM_MODE_P56V57_4K, sz >= 59);
> +               guest_mode_append(VM_MODE_P50V48_4K, sz >= 50);
> +               guest_mode_append(VM_MODE_P41V39_4K, sz >= 41);

Even when the host doesn't support P59 a guest may still use V57 (and when
a host doesn't support P50 a guest may still use V57 or V48). The host
simply doesn't describe physical memory with address bit widths greater
than its limits to the guest. Then the guest is free to use whatever
virtual address width is supported by the MMU. IOW, we need all
combinations of P and V widths for modes and then select similarly to how
Arm has multiple modes to manage all the different page sizes. Also in
order to know the maximum supported virtual bit width we need to
get-one-reg satp_mode. We should do that here instead of in
riscv_vcpu_mmu_setup() in order to filter out invalid modes when
appending them.

Thanks,
drew

>         }
>  #endif
>  }
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index a055343a7bf7..4cd69fffa06d 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -224,6 +224,9 @@ const char *vm_guest_mode_string(uint32_t i)
>                 [VM_MODE_P36V48_64K]    = "PA-bits:36,  VA-bits:48, 64K pages",
>                 [VM_MODE_P47V47_16K]    = "PA-bits:47,  VA-bits:47, 16K pages",
>                 [VM_MODE_P36V47_16K]    = "PA-bits:36,  VA-bits:47, 16K pages",
> +               [VM_MODE_P56V57_4K]     = "PA-bits:56,  VA-bits:57,  4K pages",
> +               [VM_MODE_P50V48_4K]     = "PA-bits:50,  VA-bits:48,  4K pages",
> +               [VM_MODE_P41V39_4K]     = "PA-bits:41,  VA-bits:39,  4K pages",
>         };
>         _Static_assert(sizeof(strings)/sizeof(char *) == NUM_VM_MODES,
>                        "Missing new mode strings?");
> @@ -251,6 +254,9 @@ const struct vm_guest_mode_params vm_guest_mode_params[] = {
>         [VM_MODE_P36V48_64K]    = { 36, 48, 0x10000, 16 },
>         [VM_MODE_P47V47_16K]    = { 47, 47,  0x4000, 14 },
>         [VM_MODE_P36V47_16K]    = { 36, 47,  0x4000, 14 },
> +       [VM_MODE_P56V57_4K]     = { 56, 57,  0x1000, 12 },
> +       [VM_MODE_P50V48_4K]     = { 50, 48,  0x1000, 12 },
> +       [VM_MODE_P41V39_4K]     = { 41, 39,  0x1000, 12 },
>  };
>  _Static_assert(sizeof(vm_guest_mode_params)/sizeof(struct vm_guest_mode_params) == NUM_VM_MODES,
>                "Missing new mode params?");
> @@ -351,6 +357,15 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
>         case VM_MODE_P44V64_4K:
>                 vm->pgtable_levels = 5;
>                 break;
> +       case VM_MODE_P56V57_4K:
> +               vm->pgtable_levels = 5;
> +               break;
> +       case VM_MODE_P50V48_4K:
> +               vm->pgtable_levels = 4;
> +               break;
> +       case VM_MODE_P41V39_4K:
> +               vm->pgtable_levels = 3;
> +               break;
>         default:
>                 TEST_FAIL("Unknown guest mode: 0x%x", vm->mode);
>         }
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index 2eac7d4b59e9..de84c092f982 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -197,22 +197,35 @@ void riscv_vcpu_mmu_setup(struct kvm_vcpu *vcpu)
>  {
>         struct kvm_vm *vm = vcpu->vm;
>         unsigned long satp;
> +       unsigned long satp_mode;
> +       unsigned long max_satp_mode;
> 
>         /*
>          * The RISC-V Sv48 MMU mode supports 56-bit physical address
>          * for 48-bit virtual address with 4KB last level page size.
>          */
>         switch (vm->mode) {
> -       case VM_MODE_P52V48_4K:
> -       case VM_MODE_P48V48_4K:
> -       case VM_MODE_P40V48_4K:
> +       case VM_MODE_P56V57_4K:
> +               satp_mode = SATP_MODE_57;
> +               break;
> +       case VM_MODE_P50V48_4K:
> +               satp_mode = SATP_MODE_48;
> +               break;
> +       case VM_MODE_P41V39_4K:
> +               satp_mode = SATP_MODE_39;
>                 break;
>         default:
>                 TEST_FAIL("Unknown guest mode, mode: 0x%x", vm->mode);
>         }
> 
> +       max_satp_mode = vcpu_get_reg(vcpu, RISCV_CONFIG_REG(satp_mode));
> +
> +       if ((satp_mode >> SATP_MODE_SHIFT) > max_satp_mode)
> +               TEST_FAIL("Unable to set satp mode 0x%lx, max mode 0x%lx\n",
> +                         satp_mode >> SATP_MODE_SHIFT, max_satp_mode);
> +
>         satp = (vm->pgd >> PGTBL_PAGE_SIZE_SHIFT) & SATP_PPN;
> -       satp |= SATP_MODE_48;
> +       satp |= satp_mode;
> 
>         vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(satp), satp);
>  }
> --
> 2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
