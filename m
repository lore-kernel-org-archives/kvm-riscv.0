Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B09D606A32A
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y5vuWNIV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZRQ8XMP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K0jprj/2Js68I7h+5qW7PxFWFq5cGuOIOpdNEwS0fKY=; b=Y5vuWNIV5Kz9PPcXbUWM47p7YZ
	M/L9JPeOV9Gm+Yaoxe7z1NKozFP8y9ygjBHN5Ax6HgqLgisFECJPMnvtxpvfz3er4z2QdLXJ3nirS
	BZ9UwwG9PHLxsSMdegWYH9Zk21MfrRM49s/4dipP26ia68V9pw0+V65yYqtosKkAboyII7pQbkdDq
	AU3QsvKEiBRJjbtvk8aRTvWuDMmgikro4Y6oHjhQ2AQRo1NnC8di2EvmYF5mNgxfXPX/jQ3hwpcyL
	/fteP55XaD1SDKQ2fzUBG+LsaX8jI5vSYYFmGC9vNhs8UTdu9FkRZBomtJ2I9Y1zTQsgo7TJRqGZA
	iILp3arg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd3u-0000000E1jl-0UvG;
	Thu, 26 Nov 2026 17:15:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd3s-0000000E1jY-0QvH
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 17:15:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D800945386;
	Thu, 26 Nov 2026 17:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE1C1F000C6;
	Thu, 26 Nov 2026 17:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795713307;
	bh=ACwThbHhdyubLgbGG8BlT9YALy16BOCqO3d8ao1PpM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JZRQ8XMPv43uPWp1uQsQh5tT8GVHv7TD3cz9gE9JPhxgn7xl4AniQSdquMh8Yvg46
	 yVPqMVHUclpkPjRZTLtmTW5aF3wpw0yIXRreNeXU23dQHoBoXgcZKYcrENFkIHve34
	 Y4TQ9Rh9RapKYmTQFH832rTnZ42ObV4OIvCTPd/dtNrw37X5DBw8gAH1KOlh4nlAf2
	 C079li9IqpHo3mOdaDO4F/mTQ+LHztyYWW0Yrc2dKg7l1k1ws6xQOQjoO55JwzfLqE
	 3AWVKnMRXtUvHsQQQ4MBpMPyEGVBdEC2x1CHvOMMWeKTkfpav0pW9T7crDwfO6UKAY
	 fbZasCOPfNv5w==
From: Will Deacon <will@kernel.org>
To: Julien Thierry <julien.thierry.kdev@gmail.com>,
	Mika Tammi <mikatammi@gmail.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	kvm@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH kvmtool] riscv, arm64, powerpc: Align the FDT staging buffer to 8 bytes
Date: Thu, 26 Nov 2026 17:14:36 +0000
Message-ID: <179570952413.2896399.3729150509718337186.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028190531.48302-1-mikatammi@gmail.com>
References: <20261028190531.48302-1-mikatammi@gmail.com>
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

On Wed, 28 Oct 2026 20:05:31 +0100, Mika Tammi wrote:
> setup_fdt() creates the guest's device tree in staging_fdt, a u8 array
> on the stack, and then copies it into guest memory with fdt_open_into().
> 
> The Devicetree Specification requires the blob to be at an 8-byte
> aligned address [1], and libfdt has checked this since dtc v1.6.1:
> fdt_ro_probe_() fails with -FDT_ERR_ALIGNMENT for any other address.
> The sequential-write functions don't call it, so the tree is created
> without errors and fdt_open_into() is the first call to fail.
> 
> [...]

Applied to kvmtool (master), thanks!

[1/1] riscv, arm64, powerpc: Align the FDT staging buffer to 8 bytes
      https://git.kernel.org/will/kvmtool/c/6ad12e755313

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
