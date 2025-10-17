Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD4ACCD199
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zy+QomXu9bQ0QGbQQNaKzm+f6ZxKmvCMy8qwoftTf2U=; b=lZLHgXyD/jCOIm
	bshGONa3N9jhn43XQkjOiinJCQxj2JhoIzPvV1dWpmH1hQvMvr5c8tChUi5YEHQ8CeVChmlqwXPaQ
	aV5OQ5eyWMiKgxYBh+mMcKM7QPbDoL/HRrx51/M9JA4UYhlTK+XepNdD6/j4H+3aA7gTc6dPKqdzQ
	RfGGirQhbslcpY6FMhAZpS2hxyJ6c+XrgvkEhBmh4PwNV4OmW++Qw2aBB+3vzMSL/UaZLaRytbWAc
	s/Ui8UDOgGNVtVONE8t5GEY/6r4Tm+Npchqw74T0qoXPgeLDwkyVTlj9F/pm49DwbrETa7cUM0Uj4
	Y8k5TDv/qI/8Ib6zRGCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mwt-00000008MyE-2YtQ;
	Fri, 17 Oct 2025 16:04:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mws-00000008Mxe-073V
	for kvm-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SvJpBvOxY/CPj4QnQ1neShnGYHWpMpPjYGQCrWAehTg=; b=qhumYUZ7LbELQ0qAoZLxXpebfl
	IsjhoYd65MjI9385GlLIVwE6Qee0swPi9uQ2bLl5enPxTUGEmUj+MYlLG5yrve7tICn43oTuu0seg
	dd8blwKw0m31EvBX6kJZL2AmNlB9Wpc0RJ60rYkXIEDLPwfSVJdgJ0B/o6a3zljnb0KKEuKTseTGX
	Fta7g7J+vzLrJVUV/oDjIIgngmK6uKa1THhaiXbq8sm+VTLP16Hl060vE8/KmSFafqLY6cl7uNZ3A
	mF1m06REY9jWwwMusZyv58I0zpgdd8dlCSHCgf3JJ74uDwxyS9zu5SiIg8VYCzR1khS6WMygFfTmG
	MQzhFtUg==;
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mwi-00000007ilz-1YUp
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:04:52 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-92cebee95a8so88861039f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Oct 2025 09:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760717086; x=1761321886; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SvJpBvOxY/CPj4QnQ1neShnGYHWpMpPjYGQCrWAehTg=;
        b=lD9GOyMNjPnz+5k/HdqrKofQiJ5/OlvO+JgzDj5ygA45zoOgwzdgcqIVYuIrw1MxuV
         iIx9owTPb3pYnOyI8CndSRsM6fA6hwL0PXcLSNXU55V9NB61G7gRL3cU6C0dqc6Js/tn
         Uh7yd1jPd++Wy1IjzCJ+RRzbNtUblvOBAvg+USKQHSPUFe2XB/QVEQa+2nZwST4IAAt2
         3ov/9uH9bTy7fxrhCHsOetyptyEhnTsXMiH4JjJU0qzBK1BkSrx4eslPqqKs4fIjA9FT
         Zm7bO2KIQHqMw9bVsmuddW4kYJaHt2ctHKlwZupkAdIkfZ3FRp7Sd9tXD656kMorECsx
         F9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717086; x=1761321886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvJpBvOxY/CPj4QnQ1neShnGYHWpMpPjYGQCrWAehTg=;
        b=DyfhAPkhaewW+2awNz+Zt5yH4RZXFJJQY1LUXuE1p7G6OR/p9keTMOv5hhSWP7czDE
         t7pcFyFV4E/845Tc0wQqkAUkUlau6yotb78iQl+jguVZICtswLPmNkQDKiSyNDHLrBQU
         IdbJky5g++8oA4piWs/ucunh+U5jx7Tpwyisuqzhcd+iJoj3wtEc+x7QjlCFlNgzbaSr
         mHjnlf0/Rg48s2ke4sZzQxyYxsemuyt5/dRxz5os2DodX+DAe62HarceCIr9DKtZ4EQ0
         aRLEKB5DSSIPUOBChjdM8ZMyVFMRdy4SQ7zZCpkcDcOT4vpDpW5qwWyrwovs83u4IO9J
         GdOg==
X-Gm-Message-State: AOJu0YwSR0zS9AaFGgqGK9ozpgzN0CT3EQYPoZnscqin+hilxysUCiyD
	EEihzjZ/a9yNsexkrlELcP69Pc6XPSHj5ZiC5MWhk+F2b7GfZ5fRzuRWoWGkLAwOrjDO8/Jhn/Q
	yJrFbIEw=
X-Gm-Gg: ASbGncuhSPL3Kz/b7zaqVWz0WFzsgeG6zofDsY8WuR17QOKntW1PvSsinaSXWPCV1aN
	rZj2aMYMmzdneJrG3Kmivhu4/Angw3iL1qVZ/V14YYj1LrlCRLxwMyhL7FcEfRq40J0fHD2X5K7
	DfHh/+o8TzOtOmkVj82LK7CgETEIh+1w0sbNDcd0grrUOuBZPPCaluBKLBnHHGg+t9ELl83gw30
	wPJG4YxJucM802IyWWPbikUYHCB8oBS62QmUiNwbmr9uZEzCAc1U/mBVsNAas+JfYMPrVZfg4w4
	SgKBr3+ORQM0OVflQJ4sUs1wSDz54Z4Ta/UhUAgUQm5Lh+V4Fv67N3cgO29kxIfY7dE1FyLZmCf
	5/sIQU59C2somVc0EdK6W1a95auiXcdBktudKIXplStDvGI2xSOe+K14IK6mChNCBdztby9N/UG
	LGcg==
X-Google-Smtp-Source: AGHT+IH91gtjg4MEDAfFBXyD5uwoG2Mo/ry27+3Ys5Ih0x7eQMipoHQlZ7P3xEdgqy8bloN7nFmVBg==
X-Received: by 2002:a05:6e02:178e:b0:430:d061:d9f7 with SMTP id e9e14a558f8ab-430d061da22mr4773715ab.23.1760717085569;
        Fri, 17 Oct 2025 09:04:45 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9601be8sm11030173.4.2025.10.17.09.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:04:45 -0700 (PDT)
Date: Fri, 17 Oct 2025 11:04:44 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: wu.fei9@sanechips.com.cn
Cc: kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] KVM: riscv: selftests: Detect supported vm modes
Message-ID: <20251017-f2c1b717d2364067c64f95a6@orel>
References: <20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn>
 <202510170319.59H3JmWd056039@mse-fl2.zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202510170319.59H3JmWd056039@mse-fl2.zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_170450_780036_3CD1F112 
X-CRM114-Status: GOOD (  26.71  )
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

On Fri, Oct 17, 2025 at 11:15:57AM +0800, wu.fei9@sanechips.com.cn wrote:
> The default vm mode on riscv is hardcoded to sv48, which causes tests to
> fail on platform supporting sv39 only, such as '-cpu rva23s64' on qemu.
> This patch detects the support vm modes and sets default to the maximum
> supported one.
> 
> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
> ---
>  .../testing/selftests/kvm/include/kvm_util.h  |  4 ++-
>  .../selftests/kvm/include/riscv/processor.h   |  2 ++
>  tools/testing/selftests/kvm/lib/guest_modes.c | 24 +++++++++----
>  .../selftests/kvm/lib/riscv/processor.c       | 36 +++++++++++++++++++
>  4 files changed, 59 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 02224bc514d4..7bc2ee9f0cad 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -234,7 +234,9 @@ extern enum vm_guest_mode vm_mode_default;
>  #error "RISC-V 32-bit kvm selftests not supported"
>  #endif
> 
> -#define VM_MODE_DEFAULT                        VM_MODE_P50V48_4K
> +extern enum vm_guest_mode vm_mode_default;

We can just move this declaration out of the #ifdef __aarch64__ region.
It shouldn't harm other architectures.

> +
> +#define VM_MODE_DEFAULT                        vm_mode_default
>  #define MIN_PAGE_SHIFT                 12U
>  #define ptes_per_page(page_size)       ((page_size) / 8)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 162f303d9daa..2d5a5548e698 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -191,4 +191,6 @@ static inline void local_irq_disable(void)
>         csr_clear(CSR_SSTATUS, SR_SIE);
>  }
> 
> +unsigned long riscv64_get_satp_mode(void);
> +
>  #endif /* SELFTEST_KVM_PROCESSOR_H */
> diff --git a/tools/testing/selftests/kvm/lib/guest_modes.c b/tools/testing/selftests/kvm/lib/guest_modes.c
> index 63d0d5479188..9c4a9e86223e 100644
> --- a/tools/testing/selftests/kvm/lib/guest_modes.c
> +++ b/tools/testing/selftests/kvm/lib/guest_modes.c
> @@ -4,7 +4,7 @@
>   */
>  #include "guest_modes.h"
> 
> -#ifdef __aarch64__
> +#if defined(__aarch64__) || defined(__riscv)
>  #include "processor.h"
>  enum vm_guest_mode vm_mode_default;
>  #endif
> @@ -13,9 +13,11 @@ struct guest_mode guest_modes[NUM_VM_MODES];
> 
>  void guest_modes_append_default(void)
>  {
> -#ifndef __aarch64__
> +#if !defined(__aarch64__) && !defined(__riscv)
>         guest_mode_append(VM_MODE_DEFAULT, true);
> -#else
> +#endif
> +
> +#ifdef __aarch64__
>         {
>                 unsigned int limit = kvm_check_cap(KVM_CAP_ARM_VM_IPA_SIZE);
>                 uint32_t ipa4k, ipa16k, ipa64k;
> @@ -74,10 +76,20 @@ void guest_modes_append_default(void)
>  #ifdef __riscv
>         {
>                 unsigned int sz = kvm_check_cap(KVM_CAP_VM_GPA_BITS);
> +               unsigned long satp_mode = riscv64_get_satp_mode() << SATP_MODE_SHIFT;
> +               int i;
> 
> -               guest_mode_append(VM_MODE_P56V57_4K, sz >= 59);
> -               guest_mode_append(VM_MODE_P50V48_4K, sz >= 50);
> -               guest_mode_append(VM_MODE_P41V39_4K, sz >= 41);
> +               guest_mode_append(VM_MODE_P56V57_4K, satp_mode >= SATP_MODE_57 && sz >= 59);
> +               guest_mode_append(VM_MODE_P50V48_4K, satp_mode >= SATP_MODE_48 && sz >= 50);
> +               guest_mode_append(VM_MODE_P41V39_4K, satp_mode >= SATP_MODE_39 && sz >= 41);

Something along these lines was what I was suggesting in the last patch,
but where we select from many more combinations of P and V for modes.

VM_MODE_P41V39_4K
VM_MODE_P41V48_4K
VM_MODE_P41V57_4K
VM_MODE_P50V48_4K
VM_MODE_P50V57_4K
VM_MODE_P59V57_4K

> +
> +               // set the first (maximum) supported mode as default

Please, no C++ comments, and don't we want a V39 mode to be the default?
In fact, VM_MODE_P41V39_4K should always be supported, so we can just set
VM_MODE_DEFAULT to that.

Thanks,
drew

> +               vm_mode_default = NUM_VM_MODES;
> +               for (i = 0; vm_mode_default == NUM_VM_MODES && i < NUM_VM_MODES; i++) {
> +                       if (guest_modes[i].supported && guest_modes[i].enabled)
> +                               vm_mode_default = i;
> +               }
> +               TEST_ASSERT(vm_mode_default != NUM_VM_MODES, "No supported mode!");
>         }
>  #endif
>  }
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index de84c092f982..eac67cb21f50 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -8,6 +8,7 @@
>  #include <linux/compiler.h>
>  #include <assert.h>
> 
> +#include "guest_modes.h"
>  #include "kvm_util.h"
>  #include "processor.h"
>  #include "ucall_common.h"
> @@ -528,3 +529,38 @@ unsigned long get_host_sbi_spec_version(void)
> 
>         return ret.value;
>  }
> +
> +void kvm_selftest_arch_init(void)
> +{
> +       /*
> +        * riscv64 doesn't have a true default mode, so start by detecting the
> +        * supported vm mode.
> +        */
> +       guest_modes_append_default();
> +}
> +
> +unsigned long riscv64_get_satp_mode(void)
> +{
> +       int kvm_fd, vm_fd, vcpu_fd, err;
> +       uint64_t val;
> +       struct kvm_one_reg reg = {
> +               .id     = RISCV_CONFIG_REG(satp_mode),
> +               .addr   = (uint64_t)&val,
> +       };
> +
> +       kvm_fd = open_kvm_dev_path_or_exit();
> +       vm_fd = __kvm_ioctl(kvm_fd, KVM_CREATE_VM, NULL);
> +       TEST_ASSERT(vm_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VM, vm_fd));
> +
> +       vcpu_fd = ioctl(vm_fd, KVM_CREATE_VCPU, 0);
> +       TEST_ASSERT(vcpu_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VCPU, vcpu_fd));
> +
> +       err = ioctl(vcpu_fd, KVM_GET_ONE_REG, &reg);
> +       TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_GET_ONE_REG, vcpu_fd));
> +
> +       close(vcpu_fd);
> +       close(vm_fd);
> +       close(kvm_fd);
> +
> +       return val;
> +}
> --
> 2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
