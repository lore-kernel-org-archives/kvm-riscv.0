Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC18606A327
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 17:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DNnMA5sD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bfnc/BMs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S3+2x4WPvnmSO+oH5BPwQHcAibVgzr7keUHqbRJU4vw=; b=DNnMA5sD9ExrPxlX4GVvFjEpmx
	93bo18p+SomzeELjNLc3JjPZucoyJoxD8sLKCWd4k5RDgHtz1WpKoo8EzuFIJTyRS/royRy+G0Jrg
	5jkjFiT1leGf24IAy7F1IeGgnyqc0woD9JUBEMB0HVk8RqEdhhIEWCfRMidgy4rrpa0twgePBpLQG
	iQsGeg2ub0dx6dZwlNgkMqK0J9JsPN99/ebusP1aElgj80ELnh21KBkQk9RBza+CRo9q1QOvNQPl/
	NrHfqJBzbYd2j7HB0YYsZegUN31zZgVTEraIq4lZiTHROK76u2nWnWQWTkHKRlkqECSadBgSI1kQx
	LiFpIdvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd3e-0000000E1h4-0EoR;
	Thu, 26 Nov 2026 17:14:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd3c-0000000E1gd-2TfD
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 17:14:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B4A8260229;
	Thu, 26 Nov 2026 17:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B861F000C4;
	Thu, 26 Nov 2026 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795713291;
	bh=TQwlNEzbmht4hnnX8BCTGxhRsczcBut+0fxv15UgHBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bfnc/BMsSmca+5qiho/vQXFWa8NAWkgC+lynnXTrjDF2vYFdGz/P9AffZYCRv9C8w
	 fHbgqAzGHfTfTMpxv+iILy9o13OI6WnornOjbGavMbMqfQukUIwvdqtT9OTZCcZ/hV
	 6hzAdT7/+SDSruc1i2IMoKSXNk2dUYa59/AMtzpLputj7Q+wqkju9IRTL+lSTR0EV9
	 d3gG2Jg9sHAVScYPLyLObMYkFBOn/Wt31riJk6TTaWfNi0SKAXfIp9E6ExU1EvpQY4
	 t7QHrdcJi1mc0LMd9ldEednm17l7hQ9RheS91pK0Oy00vDKrGNLFTV16krOSrG17IF
	 uJ4E7OMhq9+jQ==
From: Will Deacon <will@kernel.org>
To: kvm@vger.kernel.org,
	julien.thierry.kdev@gmail.com,
	Andrew Jones <andrew.jones@linux.dev>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	kvm-riscv@lists.infradead.org,
	Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH kvmtool] riscv: Place the FDT after the kernel's image_size
Date: Thu, 26 Nov 2026 17:14:30 +0000
Message-ID: <179570915035.2893259.9450274384721456114.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019144304.2678066-1-andrew.jones@linux.dev>
References: <20261019144304.2678066-1-andrew.jones@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026 16:43:04 +0200, Andrew Jones wrote:
> The FDT is placed relative to the end of the kernel image file, but a
> kernel's memory footprint includes its BSS, which isn't in the file. When
> the BSS is large enough, e.g. with lockdep enabled, the FDT lands inside
> it and is wiped when the kernel clears BSS, leaving the guest hung with no
> console output. Use the image_size from the Image header, as arm64 does.
> 
> 
> [...]

Applied to kvmtool (master), thanks!

[1/1] riscv: Place the FDT after the kernel's image_size
      https://git.kernel.org/will/kvmtool/c/fcaa9485b7a9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
