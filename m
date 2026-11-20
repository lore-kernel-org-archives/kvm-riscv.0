Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB79606A326
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xDXpNHuo;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Xa4FK9Bm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WEtqNtRs1O7zEMbjdSaVa81FGKvewmYlQvNi6OwJlBc=; b=xDXpNHuoO3oWkCLAU/M6gjd/ME
	HYHI0bEL4M60E2KbLoB9lY1HLqpV+1gNE7bzdlykC9ZewVP2xqXvqg0mnzXJRLp//c00xfjtGWc6W
	4dKqPJb9Z7FjxIOSXyYMe7cyimSNqmS0y8aw9sP3IAPlsFb4MLVYkTytLaN7Ndyud//O8W27jikvC
	46siSn+txuGR3Hebr3Rbowx3vTZZogmRX91gMmCaa91BK2VZoN0wCLVkuWy7xsYvvuiIDIEGukZGz
	BSvsMqeOR7z9Vg5QF05R5y15RqY7dIthke07nw9tpfHzW4QflS1nai4KphYBdVrHJQ/Vn/AC5RwmC
	pUw63rhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUP1e-0000000FBDV-2zTS;
	Fri, 20 Nov 2026 13:51:38 +0000
Received: from out-209.mta0.migadu.com ([2001:41d0:1004:224b::d1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUP1c-0000000FBCd-1uEC
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 13:51:37 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8Ps6GGoXNICr5SN/Qj56AMlLGmskLlThcLaD1co4uGo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795182694; v=1; x=1795787494;
 b=Xa4FK9BmxtlNfJv+j9MEuwW8GFXQ0i1NUDUV4h9UnyK60Y4rM3e7YByY/YpcNFECChO89hrW
 4tcmykh+PB70nPO1S1Ub3Ui+pPLwKx04Q8j1Yl90suWkBchQY5n5yV5tkf+ipnyKRkrIza/JWpZ
 uuBQR4IzAEXxPv1dgsUy8W/c=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ebafcd7b095d4e2d;
	Fri, 20 Nov 2026 13:51:34 +0000
X-Mizu-Trace-ID: ebafcd7b095d4e2d
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 14:51:00 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v2 3/8] riscv: Add ACPI support for timer
 frequency discovery
Message-ID: <awBQL-e_PtSmrfm-@orel>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
 <20261105082035.133680-4-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105082035.133680-4-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_055136_636139_91B52912 
X-CRM114-Status: GOOD (  15.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 04:20:30PM +0800, Xiang W wrote:
> When a DT is not provided, read the system time base frequency from
> the RHCT instead of aborting in timer_get_frequency().
> 
> RHCT Time Base Frequency is the ACPI equivalent of the DT
> /cpus timebase-frequency property and is the same for all harts.
> Keep DT as the preferred path when one is available.
> 
> Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
> ---
>  lib/acpi.h        |  9 +++++++++
>  lib/riscv/timer.c | 38 ++++++++++++++++++++++++++------------
>  2 files changed, 35 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/acpi.h b/lib/acpi.h
> index f6c92d28..0589669b 100644
> --- a/lib/acpi.h
> +++ b/lib/acpi.h
> @@ -20,6 +20,7 @@
>  #define MADT_SIGNATURE ACPI_SIGNATURE('A','P','I','C')
>  #define SPCR_SIGNATURE ACPI_SIGNATURE('S','P','C','R')
>  #define GTDT_SIGNATURE ACPI_SIGNATURE('G','T','D','T')
> +#define RHCT_SIGNATURE ACPI_SIGNATURE('R','H','C','T')
>  
>  #define ACPI_SIGNATURE_8BYTE(c1, c2, c3, c4, c5, c6, c7, c8) \
>  	(((uint64_t)(ACPI_SIGNATURE(c1, c2, c3, c4))) |	     \
> @@ -325,6 +326,14 @@ struct acpi_table_gtdt {
>  	u32 virtual_el2_timer_flags;
>  };
>  
> +struct acpi_table_rhct {
> +	ACPI_TABLE_HEADER_DEF
> +	u32 flags;
> +	u64 time_base_freq;
> +	u32 node_count;
> +	u32 node_offset;
> +};
> +
>  /* Reset to default packing */
>  #pragma pack()
>  
> diff --git a/lib/riscv/timer.c b/lib/riscv/timer.c
> index 18063b7e..a3af7e2b 100644
> --- a/lib/riscv/timer.c
> +++ b/lib/riscv/timer.c
> @@ -13,24 +13,38 @@
>  #include <asm/smp.h>
>  #include <asm/timer.h>
>  
> +#ifdef CONFIG_EFI
> +#include <acpi.h>
> +#endif

No need for this EFI guard.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
