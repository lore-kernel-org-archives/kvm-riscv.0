Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8184C36008
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 18:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUuET3xrupeJr7NV11cVNiiuWJR9H+g/esQAgs+iNnM=; b=nR8Vs8TgKGGboD
	9BUhVnjudZq5lHuIVEP42fTWmBuj24v2W8RkeHSl0zNzKvVVIt6rWnxXG2BVRb7GZtUy6IZ5UtjHz
	c+TnrOPA/NOVGCwbfOFdtzILZjqpJUCDM0GWE2do99/Sx6HJQDHQrGqeFK5nYJlbKOrKUBZ+lFZvE
	Ej7IGM1nL/xC6YMf1pjhekw2sR0pfzhNYBlKD+yMcZ7QO6HK6pozBQn+3yiQMPnzoLa7CD8EX2Xy5
	v2Vl9H3wDHyCe+F3cbqDQoFBmohn0oEDf5g3Ybc1gXjBSWhDM8My+WxAs3O54NXOZ31eO1F8YQ6zR
	O/LL2G8KGCtlQ1IwpgjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txVr1-00000009OB1-24bV;
	Wed, 26 Mar 2025 18:51:55 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txVqy-00000009OAC-2CPm
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 18:51:54 +0000
Date: Wed, 26 Mar 2025 19:51:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743015104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=voLt4fdXkebJ8L5qGd4jfGNS1skgHWQ+LCozPmJP+KU=;
	b=MSZ7FCH4Xov8R8XeH4gys0oHruqKkh9bTmrsyVLsIIO6DS06RHAmdvtLm3jLtsNmzDx3vs
	Fk09iJ8yU1xL+QQDBL4dynEcNxydkaLNMuMva01esQVZviti/FdEOsycKLf8xy5FNoZKRt
	I2jds9vfmYQybdHRoddC0bHmDmg7fBU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: alexandru.elisei@arm.com, eric.auger@redhat.com, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v3 0/5] arm64: Change the default QEMU CPU
 type to "max"
Message-ID: <20250326-adedac8bee1bcff68cb0b849@orel>
References: <20250325160031.2390504-3-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250325160031.2390504-3-jean-philippe@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_115152_863746_31C1D3FC 
X-CRM114-Status: GOOD (  11.48  )
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

On Tue, Mar 25, 2025 at 04:00:28PM +0000, Jean-Philippe Brucker wrote:
> This is v3 of the series that cleans up the configure flags and sets the
> default CPU type to "max" on arm64, in order to test the latest Arm
> features.
> 
> Since v2 [1] I moved the CPU selection to ./configure, and improved the
> help text. Unfortunately I couldn't keep most of the Review tags since
> there were small changes all over.
> 
> [1] https://lore.kernel.org/all/20250314154904.3946484-2-jean-philippe@linaro.org/
> 
> Alexandru Elisei (3):
>   configure: arm64: Don't display 'aarch64' as the default architecture
>   configure: arm/arm64: Display the correct default processor
>   arm64: Implement the ./configure --processor option
> 
> Jean-Philippe Brucker (2):
>   configure: Add --qemu-cpu option
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

Thanks Jean-Philippe. I'll let Alex and Eric give it another look, but
LGTM.

drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
