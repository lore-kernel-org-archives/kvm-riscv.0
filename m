Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298A4C369A4
	for <kvm-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFrqGV0NqXVkIK0zfHXdPS6u3ipb4jXWC0Ab3RT6bGU=; b=zvXeF7my4l/NeC
	iZb/gJ15/pUKVlxfazRKoTrRIiysVW8bGKnqRJLBpzOnOvr/fwqZbzNFpJjwDbNvrDt3am6l1ZBaB
	vLHasqKJ+w+ZMPOZpSPiTn6Xri+2mL7tXQ2Iqg+Btn1COT8+xEYiXuC3YLbHr7sLo2gAyFZwW1Vrj
	NCN3DFj1cYy5Y/ryuhQ9gUakWT3phsFmZ7u91XHcSl4OSLWXL89t8mORj7f9CkrRUzyAxQIaRgJww
	FDiA/EItoISEHcQLBALpE6w3sSZHq3iQvNssy9hRSTpsyKmpsceoxzCq6P2uHtXmgRHYHWy3dfrit
	xAkBhcPgEEXaq4Evyc6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Aht-00000004Xuf-3qMy;
	Tue, 08 Apr 2025 15:17:45 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Agr-00000004XkV-2U5V
	for kvm-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 15:16:43 +0000
Date: Tue, 8 Apr 2025 17:16:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744125399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wmc1pf0dMe1civmuPe4PR0IF2C08oxETmfh5prhw71Y=;
	b=xuIjBJRg3cgiIsPSc3jONNRS85OpGCFPuDO8OLg9NMBYHr9Es9LJHG35OsqYvsJ3iZKCr5
	3qYPBaImOWgXyfzgxJl1cAlw6uSfm5iuVos5BrEsWlqG/RPgXxxn6KNrAR0rfPB62u9iZz
	4TY6BPImiVgC4loEQvvTlHOiKsnHIHw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: alexandru.elisei@arm.com, eric.auger@redhat.com, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v4 0/5] arm64: Change the default QEMU CPU
 type to "max
Message-ID: <20250408-e5599f590076931ea514679c@orel>
References: <20250408132053.2397018-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250408132053.2397018-2-jean-philippe@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_081641_769366_F79BF759 
X-CRM114-Status: GOOD (  10.47  )
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

On Tue, Apr 08, 2025 at 02:20:49PM +0100, Jean-Philippe Brucker wrote:
> This is v4 of the series that cleans up the configure flags and sets the
> default CPU type to "max" on arm64, in order to test the latest Arm
> features.
> 
> Since v3 [1] I renamed --qemu-cpu to --target-cpu, to prepare for other
> VMMs.
> 
> [1] https://lore.kernel.org/all/20250325160031.2390504-3-jean-philippe@linaro.org/
> 
> 
> Alexandru Elisei (3):
>   configure: arm64: Don't display 'aarch64' as the default architecture
>   configure: arm/arm64: Display the correct default processor
>   arm64: Implement the ./configure --processor option
> 
> Jean-Philippe Brucker (2):
>   configure: Add --target-cpu option
>   arm64: Use -cpu max as the default for TCG
> 
>  scripts/mkstandalone.sh |  3 ++-
>  arm/run                 | 15 ++++++-----
>  riscv/run               |  8 +++---
>  configure               | 55 +++++++++++++++++++++++++++++++++++------
>  arm/Makefile.arm        |  1 -
>  arm/Makefile.common     |  1 +
>  6 files changed, 63 insertions(+), 20 deletions(-)
> 
> -- 
> 2.49.0
>

Merged through arm/queue.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
