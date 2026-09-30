Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520DFCA5FBA
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xPaYCfLKApNBq2jvNtJ/dAu5oqM6Vv4MzRhPR2gIkY=; b=cGJXXf9joRNivI
	jnh1I9g6I8P40wl9Ske7ACgima+XRRWA0N6UTR4YIYSjcWZ+9JDQcB7R4AIWDUQnVXou5iPdqXp3u
	PZrNYS2vikv5FzCwEMmgTNTx3AtSyES58WQDj7HWpKWXp3GxwgCFIBaGKnNI1U5DyObJAiE27u0jP
	V9XPLjcz74trnU0xeo59VjeZEw/Czq9mPSBk+kRIOAipaOY2/yc4DzHzDyU1EK+YXe0NLxbemr6Fj
	IwfbIPybkgwy0GzuLzkreJADvmvgo8E/4cbgzijs7falP4vpuYQSasRItY1H35oT8g+F6rlXRTeYY
	uEGRE6OzDt5YshF28QDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsOr-00000005rXS-47w9;
	Wed, 30 Sep 2026 11:23:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsOq-00000005rXJ-1WSa
	for kvm-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 11:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Wy1upjgi58cyKDDbRVphwKHh10bssxtKD8K1Aazz8dU=; b=efRgvNqzcGauLT9WeVFaai+fuL
	9eFt7UPaHf/cqZ4cGXcmaGlRcKg+YrdY+tNg30eQp2SeJ4K4bQ3sMrYuwXt1Uio4US+GlxWltEMav
	IXbgumfoRLgFDhyP3eXLiU07gpHiUN57W9gOPL0ThKi+xkkIQnwYyz0UGNFI25bdVIml90qErR1Sx
	A8Q2XQXixSWkgTWIXkna0LFdw3m4CbY7pFcwMY8BXcZG+xymUoxiSKSp16SDBfgS46PF/GpnmDCXb
	OI5JA9u6n4iITXpXibjoRQaf78o4x8oFqCu0Yn8tbxxw/M+t+tLbdGw4m+Z0uG8ZjKEdE6fhLfvoH
	DOw5Fcxg==;
Received: from out-208.mta0.migadu.com ([2001:41d0:1004:224b::d0] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBsOl-00000003iJv-1b47
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 11:22:59 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=UHLwJq9G2Je32qOBLOc93Igc9xV2UHXk7Mx5Wr1HmBg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790767373; v=1; x=1791372173;
 b=V7bD1jCIgTXJqkvFCtTLyW4CvZN8VY163vKkyMYWm7D3uMb+jS4+nTpRUeOwY1DqB3VbZscX
 gvW4BOIshWbuJAhfbOy9PDupULCakrtf/Pv23p3sXqtQVMuvXWrUlZady5cgGic4QY8RY1qwl/1
 uzmi+Gn1eez7yxzS7JoxDiQc=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e83f20bf38db337e;
	Wed, 30 Sep 2026 11:22:43 +0000
X-Mizu-Trace-ID: e83f20bf38db337e
X-Migadu-Flow: FLOW_OUT
Date: Wed, 30 Sep 2026 13:22:42 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com, sunilvl@oss.qualcomm.com
Subject: Re: [kvm-unit-tests PATCH 0/7] riscv: ACPI boot and BRS-I SBI tests
Message-ID: <syzvrpkpdg5gjo4q6fgeypshwc33vzlzy3r6bvu5pqwm5iogl6@gewf5shwul3k>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_122257_524657_64EA6A39 
X-CRM114-Status: GOOD (  24.19  )
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


Thanks for this series, Xiang. I'm glad to see kvm-unit-tests getting
used. But please make sure you work with the RVI BRS community to ensure
your work is aligned with their plans.

Thanks,
drew

On Thu, Sep 24, 2026 at 11:39:38AM +0800, Xiang W wrote:
> Hi,
> 
> This series lets RISC-V kvm-unit-tests boot on BRS-I platforms that
> describe the system with UEFI + ACPI instead of a device tree, and adds
> a first unit test for the SBI rules in the RISC-V Boot and Runtime
> Services specification [1].
> 
> The RISC-V port currently assumes a DT for CPU bring-up, timer
> frequency, ISA-string parsing and console setup. BRS-I firmware
> typically does not provide a usable DT, and often has no MMIO UART
> either. Without these changes the existing tests abort in setup before
> they can exercise SBI.
> 
> Patches 1-4 teach the RISC-V library to initialize from ACPI when a DT
> is absent:
> 
>   - locate the ACPI 2.0 RSDP via the EFI configuration table
>   - parse MADT RINTC entries for hart / CPU bring-up
>   - read the timebase frequency from RHCT
>   - parse the ISA string from RHCT Hart Info nodes (match by ACPI UID)
> 
> The RSDP is left in EFI_ACPI_RECLAIM_MEMORY; the RISC-V allocator does
> not reuse that region, so the table is not copied aside.
> 
> Patch 5 splits CONFIG_SBI_CONSOLE out of the UART driver. io_init()
> becomes a no-op and puts() issues SBI DBCN CONSOLE_WRITE directly, so
> EFI/ACPI guests no longer depend on a described MMIO UART to print.
> 
> Patch 6 drops the EFI runner's EFI_USE_ACPI=y early exit. The runner
> already omits -machine acpi=off in that case; QEMU virt defaults to
> ACPI enabled.
> 
> Patch 7 adds riscv/riscv-brs.c for:
> 
>   SBI_010  spec version >= 2.0
>   SBI_020  HSM required
>   SBI_030  TIME required unless Sstc
>   SBI_040  IPI required unless Ssaia
>   SBI_050  RFENCE required unless Ssaia
>   SBI_060  PMU required unless Smcsrind + Sscsrind + Smcdeleg + Ssccfg
>   SBI_070  DBCN required when ACPI SPCR Interface Type is 0x15
> 
> The new test is in group "riscv-brs nodefault", so it is not part of
> the default run_tests.sh pass. DT-only QEMU virt is unchanged.
> 
> Based on kvm-unit-tests master (5a221342).
> 
> [1] https://github.com/riscv-non-isa/riscv-brs
> 
> Testing
> =======
> Build:
> 
>   ./configure --arch=riscv64 \
>               --cross-prefix=riscv64-linux-gnu- \
>               --console=sbi --enable-efi && make
> 
> EFI + ACPI (BRS-I style):
> 
>   EFI_USE_ACPI=y EFI_UEFI=/path/to/RISCV_VIRT_CODE.fd \
>     ./riscv/efi/run riscv/riscv-brs.efi
> 
> Please review.
> 
> Xiang W (7):
>   riscv: Initialize the ACPI RSDP from the EFI system table
>   riscv: Add ACPI support for CPU initialization
>   riscv: Add ACPI support for timer frequency discovery
>   riscv: Add ACPI support for ISA string discovery
>   riscv: Decouple SBI console from UART init
>   riscv: efi: Allow ACPI boots
>   riscv: Add BRS SBI requirement tests
> 
>  lib/acpi.h                |  67 ++++++++++++++-
>  lib/riscv/asm/isa.h       |   5 ++
>  lib/riscv/asm/processor.h |   1 +
>  lib/riscv/asm/sbi.h       |   2 +
>  lib/riscv/io.c            |  50 +++++------
>  lib/riscv/isa.c           |  82 ++++++++++++++++--
>  lib/riscv/setup.c         |  55 ++++++++++++
>  lib/riscv/timer.c         |  37 ++++++---
>  riscv/Makefile            |   1 +
>  riscv/efi/run             |   5 --
>  riscv/riscv-brs.c         | 171 ++++++++++++++++++++++++++++++++++++++
>  riscv/unittests.cfg       |   4 +
>  12 files changed, 424 insertions(+), 56 deletions(-)
>  create mode 100644 riscv/riscv-brs.c
> 
> -- 
> 2.47.3
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
