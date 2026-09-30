Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E107CA5FB1
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 09:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=voelgUPfIPLM+fQJkkbnLbPuZXSlTVbED2qmkQlrUZ8=; b=w8EYg2+He73vzh
	u6u+1OJQF5fhBXLGOksqvMjJuT1PuIkFeW+MLYsclwF6oDl8TXPgWPCzAYOROibTcGmKErhpOFlXK
	hQyot0chjvQWxSy40NhYPhCueK8Q8Jaix0IwpKJ1zOe3r2x7QP0mvSsogOPBip6OS+DwxE25q8Tju
	5NxoxplMKETl63Trs4Rul7I5E6U0ctELpa/3aORkhLQv70CcPgH9IOYvi0AZqNa46675TgPS1L3Pk
	w2PXryAU9/+3KzLZzuRhvVUyxvVkiMvNmaPUIX2A3gHTCTF6lCU8KJgbQkscu4OLug2QSQczNgw9b
	mM/7C2A09vSAvZw2SgYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqxk-00000005cI9-2xKn;
	Wed, 30 Sep 2026 09:50:56 +0000
Received: from out-222.mta0.migadu.com ([2001:41d0:1004:224b::de] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqxi-00000005cHS-3HfQ
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 09:50:56 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=FKMZzLIuMUGPJesWEz83SnTluRLeLp6m+DLV2weSnBc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790761852; v=1; x=1791366652;
 b=evjStU4Kc4Ya1L24hSEl9sgDdr/c8oLIxlB7fFuu3mnfifVMgzfHnBjWn/HkmXV12UJxkmYW
 WWCgSfJGJIHdni8kkPakWLNVrPmryiEfoi1LXi9yDaQFx27xjZZ1gArjsyhZF3oPXj9ChnoaIoc
 O4qym7tPGBqeQA9BSICka68c=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e3db653f70d68817;
	Wed, 30 Sep 2026 09:50:52 +0000
X-Mizu-Trace-ID: e3db653f70d68817
X-Migadu-Flow: FLOW_OUT
Date: Wed, 30 Sep 2026 11:50:51 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH 2/7] riscv: Add ACPI support for CPU
 initialization
Message-ID: <bhisbphulilfbeouz2eap5zt6ndissa4bqwpqeksplfgmbhlc4@y6wii5vox7nl>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
 <20260924033945.176581-3-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924033945.176581-3-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_025054_967480_8FCDA4A5 
X-CRM114-Status: GOOD (  16.61  )
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

More ACPI naming comments below

On Thu, Sep 24, 2026 at 11:39:40AM +0800, Xiang W wrote:
> When a DT is not provided, discover harts from the MADT RINTC
> subtables (ACPI 6.6 type 24) instead of aborting in cpu_init_acpi().
> 
> Parse each RINTC entry for hart_id and ACPI UID, record them in
> thread_info, and mark the CPU present only if it is Enabled in
> the RINTC flags and SBI reports the hart as available.
> 
> Also add the RINTC MADT structure and the MADT types introduced
> after GENERIC_TRANSLATOR so the RISC-V interrupt controller
> entries can be identified.
> 
> Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
> ---
>  lib/acpi.h                | 30 +++++++++++++++++++++++++++++-
>  lib/riscv/asm/processor.h |  1 +
>  lib/riscv/setup.c         | 28 +++++++++++++++++++++++++++-
>  3 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/acpi.h b/lib/acpi.h
> index a62cd3a9..a905807d 100644
> --- a/lib/acpi.h
> +++ b/lib/acpi.h
> @@ -226,6 +226,22 @@ struct acpi_madt_generic_translator {
>  	u32 reserved2;
>  };
>  
> +/* 24: RISC-V Interrupt Controller (RINTC) Structure (ACPI 6.6) */
> +struct acpi_madt_rintc {
> +	u8 type;
> +	u8 length;

struct acpi_subtable_header header ?

> +	u8 version;
> +	u8 reserved;		/* reserved - must be zero */
> +	u32 flags;
> +	u64 hart_id;
> +	u32 uid;
> +	u32 ext_intc_id;
> +	u64 imsic_addr;
> +	u32 imsic_size;
> +};
> +
> +#define ACPI_RINTC_FLAGS_ENABLED	1

We already have ACPI_MADT_ENABLED

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
