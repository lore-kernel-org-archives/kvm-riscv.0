Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E24BCA5FB1
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=98vn8//vSWoYVv56uI34Baqdbc+nJ6Hx+BWEhtKN9wI=; b=2HT/adtfwiMHyd
	9coDkHdd8BnapPWoO+ZQhhb0gDhc+sxpZo8P+TKW6xCDSXLcfJCD55Fbn6X+/V4FAXjMi6PLbxdZT
	Cd2RDtdUgJYw2gw0+d51ii4hUUDAYJJSfmqYVSsyn6WW7ruezneCb1Cv5BORVQP/ftFzr3yM/YuEk
	skVNQ3cw70thg9GYJheXe0KL4FSw5cti2lwoDIbiPr3XJ/UU+4VUEFfYajdk6LAtyen1+4XtBKy3O
	2ASSfyKHCmfxsBlvpkMP3joDB8HX7/2Gn17ugl8JnS++ugeIHexf9+px9VoK2NijLa/F1BG2HEGU5
	QXLTAYkZkDh2O7jzi0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBr2l-00000005dQ0-08Dp;
	Wed, 30 Sep 2026 09:56:07 +0000
Received: from out-144.mta0.migadu.com ([2001:41d0:1004:224b::90] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBr2i-00000005dPE-2q1I
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 09:56:05 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=WqRcRYkypUXkJWaAM46u013AeQPZl1/z1oeH4D2B+tY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790762162; v=1; x=1791366962;
 b=TkuJRLCqMH+SqNoO0C+cs+D8J4MzMEMh7JgktaDJ0cA8G02oVKnsMo/BBS/QstdKY3KoyNWw
 bxr2uI7NFoULJUNZas1Xrluta7+ZAZGZa8ja1zO8CVzsgdCmaRnYbyEbfJ8F08oLFD8vwiod0uv
 dVCXZWZmwiYc5OshGdCtcJkU=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0705bfacec442bd8;
	Wed, 30 Sep 2026 09:56:02 +0000
X-Mizu-Trace-ID: 0705bfacec442bd8
X-Migadu-Flow: FLOW_OUT
Date: Wed, 30 Sep 2026 11:55:57 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH 3/7] riscv: Add ACPI support for timer
 frequency discovery
Message-ID: <5mahc2yepy4xvnntxttficdtmozod6kk7jkhpgqojy7zpdzb47@bcrufz76my3j>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
 <20260924033945.176581-4-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924033945.176581-4-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_025604_855498_D47A7F88 
X-CRM114-Status: GOOD (  14.23  )
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

Another ACPI naming comment

On Thu, Sep 24, 2026 at 11:39:41AM +0800, Xiang W wrote:
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
>  lib/riscv/timer.c | 37 +++++++++++++++++++++++++------------
>  2 files changed, 34 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/acpi.h b/lib/acpi.h
> index a905807d..2597e8ce 100644
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
> @@ -328,6 +329,14 @@ struct acpi_table_gtdt {
>  	u32 virtual_el2_timer_flags;
>  };
>  
> +struct acpi_table_rhct {
> +	ACPI_TABLE_HEADER_DEF
> +	u32 flags;
> +	u64 timebase_frequency;

Linux calls this time_base_freq

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
