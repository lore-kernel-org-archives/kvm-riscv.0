Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA60CAC5A5
	for <kvm-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 12:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4dL/eRkpqFhgaOs14WL6rPE7dPnIkoSTzad1GBVDOI=; b=oMZSwTOh5b0Vc4
	VRtOqXCWhUaQgRbgMBPQW4DVljyl9GORZp1nkrN0oyivSY/4xqyJ6OB/tpjc16ARHn2oV2tm3Y+vk
	nv69hzKMBKeEuZYazdiIblfUsPV35e6VQwjpDGdFszN5hJykKVztOjRPDNshFHl/+PKcbxU+lFBgL
	ijKp63HdUSNBL3g9ZTeYKLFb1PCCPjcYnls4L1FawrcolQKZH9o187qYugH7+UXQtbte1R6VUVGDM
	hJaC7LaUx2CMTNKskhaozKRgfOTsV87XL0tDHwSdfUoob8xnW7mjEiqPFUondSRw4KxmACHBnHHpT
	Qwzdxus6TM3l+Dep3/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1P1D-0000000Ha9R-0QZd;
	Wed, 24 Sep 2025 12:54:47 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1P1A-0000000Ha8a-3SIJ
	for kvm-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 12:54:46 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-88776dcac7aso222098239f.1
        for <kvm-riscv@lists.infradead.org>; Wed, 24 Sep 2025 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758718483; x=1759323283; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hXk5gvGOIj4B8Hhv/tzj6b7Y9tm8ywIFhspLK9qUglQ=;
        b=eFIgl5yUmgsQ7jSiDUgzbeuuxbv1deSKAMl4OAD4utcH06xn3Bug9knYYissF3SBBa
         j9BaOVo3SXwFPgNdvdLpf2Sl4GBhgExJ5YtMKhx/HqMQqsyL6O3VaBVPguhAryZLn8nS
         YEORRUV3exEttwX9iNzkx9K+uPJs7rwgg2GhX/sx5U9PmaupOQv3oDW0VLik/B9nMZPS
         pBYXpbZwajmQPPOQNhDlzd/rpa6J1RdrToYsRbyZOemIN7VrPgmEDd2gldh2tM5XCbpA
         oeaee9VbGaLcFVi5/Ca8l2mBoiyxu9QzXm8wCYIn9CMlQzaduTcW/GA65wPH8csXiVzS
         FEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758718483; x=1759323283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXk5gvGOIj4B8Hhv/tzj6b7Y9tm8ywIFhspLK9qUglQ=;
        b=Yg2l7fEOiV5aS8G37cUIBRsyU6aVl7OPjW9LCInVFWZoNiIw3K183ZW2LqLEFVRX/2
         APN35Lry1tPU1YtWtr1+fPnsShRYmE1FRoEMT/NUSkaPKrzy8PAqsv468m3+P7Ggdibq
         CHj3ozdgIxbyIIhcLkc0+VJSXIsQ8FoI0UNfluJJYtyxaek2V+neyDgv3/mQNZYvEKls
         iaCwUw4T+dBKdFAOqD9scD+HHa+fLOXOtMa8rFK8wbhgyUi9fqitsJCrReVUlRyyk8D8
         zRpNCbuY/eC35Hk/cKGXAM6lWj9cwUFXMLynTaawVSlbe5Csa1JIcHZxJdBALU3bmbz1
         I5nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVagJizsyEr2DDjR3GqbifPPFOyJm2glEdJnrabgxSQFXHdrcmtH9AJbMv2xAJCfNotHR+3oCqVRos=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWmm0ZNxw5woEYFBZb0gTfQXIyJN34/i+El2shvLYfwVF7WYbg
	r0ggmauIMqe4Hj7HxJCMr9fkCPKnrKiRj1sFKo/KuzZD6xA/p9/pGnxkYtkLWxEFufs=
X-Gm-Gg: ASbGncu3ZyhUTSJiEaxYwnad6XRRduqNK4F0DIm+gTTeauXwUndy4JfYezuLS4qxxUS
	sCZkQX07poyQHKrW1xmvspORNzdx3cTz2/FmP7pS0WUAjnTnoxWUzSORS7Ly4DVL0KZxvCrvpRs
	LzaywETf8Z6uLwSIbSmPLBjXskcuh2uN3JZS0cH9hLnxC/rPmSEuf6YSv6WlXJzI6is8mVjVKkU
	06EhFbtSjEQF6F43qhAJ9NaMFj0ysSioL8TJNg2fhu5v5cMaPn2LnJQ5P9/YTqhcrHeaG0hfLN0
	z3V+/UaKmlQiZ4nGIyKAF4vKGqbQwbz+ucA450EjTyVogNSuP9qEJnmVm6/a42QchSfOLT9/Gmw
	1Qktwp8dwDVQqqY9Gtmvp+Ew80wZF3mhf+VI=
X-Google-Smtp-Source: AGHT+IE3iBnvBMfmVf9p58xM4KWA9RxO6Yi6uROxLGwroD+MUtGpdeej2f+4Q9Zc1iv4krdN8l30nw==
X-Received: by 2002:a05:6602:27c2:b0:8fe:f51a:16b4 with SMTP id ca18e2360f4ac-8fef547e5d9mr52908239f.6.1758718483310;
        Wed, 24 Sep 2025 05:54:43 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a4832339c5sm620494639f.26.2025.09.24.05.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:54:42 -0700 (PDT)
Date: Wed, 24 Sep 2025 07:54:41 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: anup@brainfault.org, kvm-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, atishp@rivosinc.com
Subject: Re: [PATCH] riscv: Move user-visible sbi ext ids to uapi
Message-ID: <20250924-7e9764acec6722b5ef29ce7d@orel>
References: <20250917085246.1430354-1-xiangwencheng@lanxincomputing.com>
 <20250923-5498566fbd48a3dfd61ecd08@orel>
 <1be32bd0-a3d1-4fea-8f22-e050f664907b@lanxincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1be32bd0-a3d1-4fea-8f22-e050f664907b@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_055444_874995_99D6A0A9 
X-CRM114-Status: GOOD (  30.94  )
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

On Wed, Sep 24, 2025 at 10:35:25AM +0800, BillXiang wrote:
> On 9/24/2025 4:14 AM, Andrew Jones wrote:
> > On Wed, Sep 17, 2025 at 04:52:46PM +0800, BillXiang wrote:
> >> Move those sbi ext ids to uapi because they will be forwarded
> >> to user space by kvm.
> > 
> > We don't need to publish the IDs in UAPI since they are already known to
> > userspace by reading the SBI spec. Indeed QEMU already defines all of
> > these except for the experimental range.>
> > What problem are you trying to solve?
> 
> 
> I'm working on rust-vmm[1], which auto-generates the ID constants
> from uapi/kvm.h via bindgen[2]. Any ID that isn't exported there is
> invisible to us. I expect other VMMs besides QEMU will need these
> numbers as well, so let's keep one canonical definition in the UAPI
> headers for everyone to share.

But KVM isn't the authority on these IDs, the spec is. KVM and its
userspaces are just some implementations of SBI. M-mode software
and other hypervisors also implements SBI.

For Rust you can use https://docs.rs/sbi-spec/latest/sbi_spec/ to get
the constants you're looking for.

Thanks,
drew

> 
> 
> [1] https://github.com/rust-vmm
> [2] https://crates.io/crates/bindgen
> 
> > 
> > Thanks,
> > drew
> > 
> >>
> >> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
> >> ---
> >>   arch/riscv/include/asm/sbi.h      | 16 +-----------
> >>   arch/riscv/include/uapi/asm/sbi.h | 43 +++++++++++++++++++++++++++++++
> >>   2 files changed, 44 insertions(+), 15 deletions(-)
> >>   create mode 100644 arch/riscv/include/uapi/asm/sbi.h
> >>
> >> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> >> index 341e74238aa0..e196feaabb2e 100644
> >> --- a/arch/riscv/include/asm/sbi.h
> >> +++ b/arch/riscv/include/asm/sbi.h
> >> @@ -10,13 +10,12 @@
> >>   #include <linux/types.h>
> >>   #include <linux/cpumask.h>
> >>   #include <linux/jump_label.h>
> >> +#include <uapi/asm/sbi.h>
> >>   
> >>   #ifdef CONFIG_RISCV_SBI
> >>   enum sbi_ext_id {
> >>   #ifdef CONFIG_RISCV_SBI_V01
> >>   	SBI_EXT_0_1_SET_TIMER = 0x0,
> >> -	SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
> >> -	SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
> >>   	SBI_EXT_0_1_CLEAR_IPI = 0x3,
> >>   	SBI_EXT_0_1_SEND_IPI = 0x4,
> >>   	SBI_EXT_0_1_REMOTE_FENCE_I = 0x5,
> >> @@ -37,13 +36,6 @@ enum sbi_ext_id {
> >>   	SBI_EXT_NACL = 0x4E41434C,
> >>   	SBI_EXT_FWFT = 0x46574654,
> >>   
> >> -	/* Experimentals extensions must lie within this range */
> >> -	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> >> -	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
> >> -
> >> -	/* Vendor extensions must lie within this range */
> >> -	SBI_EXT_VENDOR_START = 0x09000000,
> >> -	SBI_EXT_VENDOR_END = 0x09FFFFFF,
> >>   };
> >>   
> >>   enum sbi_ext_base_fid {
> >> @@ -263,12 +255,6 @@ enum sbi_pmu_ctr_type {
> >>   #define SBI_PMU_STOP_FLAG_RESET BIT(0)
> >>   #define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
> >>   
> >> -enum sbi_ext_dbcn_fid {
> >> -	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> >> -	SBI_EXT_DBCN_CONSOLE_READ = 1,
> >> -	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
> >> -};
> >> -
> >>   /* SBI STA (steal-time accounting) extension */
> >>   enum sbi_ext_sta_fid {
> >>   	SBI_EXT_STA_STEAL_TIME_SET_SHMEM = 0,
> >> diff --git a/arch/riscv/include/uapi/asm/sbi.h b/arch/riscv/include/uapi/asm/sbi.h
> >> new file mode 100644
> >> index 000000000000..d29ac0abeefe
> >> --- /dev/null
> >> +++ b/arch/riscv/include/uapi/asm/sbi.h
> >> @@ -0,0 +1,43 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> >> +/*
> >> + * Copyright (C) 2025 Lanxincomputing Corporation or its affiliates.
> >> + *
> >> + * Authors:
> >> + *     BillXiang <xiangwencheng@lanxincomputing.com>
> >> + */
> >> +
> >> +#ifndef _UAPI_ASM_RISCV_SBI_H
> >> +#define _UAPI_ASM_RISCV_SBI_H
> >> +
> >> +
> >> +enum SBI_EXT_ID {
> >> +	/*
> >> +	* The CONSOLE_GETCHAR/CONSOLE_PUTCHAR SBI calls cannot be
> >> +	* handled in kernel so they will be forwarded to userspace by kvm.
> >> +	*/
> >> +	SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
> >> +	SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
> >> +	/*
> >> +	* Both SBI experimental and vendor extensions are
> >> +	* unconditionally forwarded to userspace by kvm.
> >> +	*/
> >> +	/* Experimentals extensions must lie within this range */
> >> +	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> >> +	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
> >> +
> >> +	/* Vendor extensions must lie within this range */
> >> +	SBI_EXT_VENDOR_START = 0x09000000,
> >> +	SBI_EXT_VENDOR_END = 0x09FFFFFF,
> >> +};
> >> +
> >> +/*
> >> +* The SBI debug console functions are unconditionally
> >> +* forwarded to the userspace by kvm.
> >> +*/
> >> +enum sbi_ext_dbcn_fid {
> >> +	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> >> +	SBI_EXT_DBCN_CONSOLE_READ = 1,
> >> +	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
> >> +};
> >> +
> >> +#endif /* _UAPI_ASM_RISCV_SBI_H */
> >> \ No newline at end of file
> >> -- 
> >> 2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
