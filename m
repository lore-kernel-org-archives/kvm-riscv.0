Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519CDD44C46
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdKwwZujnHzoUdbBsQgE3Xly/BPy45wlKxT+ZKeQO6c=; b=DgvTqMfBnm7qXu
	CWgqreOCLn9OlFeiISUxbzMbb6W7eoHHhfZrcHhZJbycBggK1nQqAA46blQ7ZPvnJO9YQETDlBqHw
	gamftEB1mQOW7+7FJzSd+Mn5012sesLIZFTvdNp0GqgSmY5AURl6dyi9kh9+QKrPch/s3qS7zqmpw
	PbBKbIS3rO4L/CHYhBslpClf0auNZukkunOOV0HTiN7r4jiCSKqCdFGNDHjgvXKf/hM9PqeW2uh+o
	q2Ia0iwB/BLaiVvIODMgjY6HhrPGFaHsCJt71tDWAv/aRZSUt8eC3BYo3AY9CCg2Ot5zwOTcqLn+s
	RhbDdCUouTc45adZN0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNem-0000000CR7c-4BSM;
	Thu, 15 Jan 2026 13:45:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNel-0000000CR77-2wv4;
	Thu, 15 Jan 2026 13:44:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2733601B4;
	Thu, 15 Jan 2026 13:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64264C116D0;
	Thu, 15 Jan 2026 13:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768484698;
	bh=DXUK5OShB9en+nMT8mpBNu33HgXEnxxQ/vgq26T3Tx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G4Zm+eDVr715b7zc+K4GFEoGu+xrAqhbtPjXRmDZCdel8oIJS9zC8QvzWQF+iHMvf
	 KVXvx6k8weAuWqytg1z5NLAJid/dAKHu0Vc8W8Ju0c3XTnSyb+2F0CljO+pImAtqKm
	 zonnD7ot93W/64d/jJXyMwzLNvJFlJmj0evnsBCUZ7cx6aXWzkWUIhQq4yr3GNlqlH
	 oCz689y9fkywS0JPdT9VBcd5XzwWdXQlYmB5rnQIhwsj5BVbtJa2TsdIZE1smxQKwC
	 PPw9xJtf6Jtn30++Ritbe4HTLF+3pXU30mDiz35oHfGQKov898uJa4MvKrZG2HVeVK
	 SA3WkhfXXyUqA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vgNeh-00000002XXF-3FHQ;
	Thu, 15 Jan 2026 13:44:55 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	pbonzini@redhat.com,
	shuah@kernel.org,
	anup@brainfault.org,
	atish.patra@linux.dev,
	itaru.kitayama@fujitsu.com,
	andrew.jones@linux.dev,
	seanjc@google.com,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v4 0/5] KVM: selftests: Alignment fixes and arm64 MMU cleanup
Date: Thu, 15 Jan 2026 13:44:53 +0000
Message-ID: <176848468177.3734174.14845458952708831898.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109082218.3236580-1-tabba@google.com>
References: <20260109082218.3236580-1-tabba@google.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tabba@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, atish.patra@linux.dev, itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, seanjc@google.com, oupton@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Fri, 09 Jan 2026 08:22:13 +0000, Fuad Tabba wrote:
> Changes from v3 [1]:
> - Renamed page_align() to vm_page_align() (Sean)
> 
> This series tidies up a few things in the KVM selftests. It addresses an
> error in memory alignment, hardens the arm64 MMU configuration for
> selftests, and fixes minor documentation issues.
> 
> [...]

Applied to next, thanks!

[1/5] KVM: arm64: selftests: Disable unused TTBR1_EL1 translations
      commit: 7e03d07d03a486c66d5c084c7185b1bef29049e9
[2/5] KVM: arm64: selftests: Fix incorrect rounding in page_align()
      commit: dd0c5d04d13cae8ff2694ef83d1ae5804d6d9798
[3/5] KVM: riscv: selftests: Fix incorrect rounding in page_align()
      commit: 582b39463f1c0774e0b3cb5be2118e8564b7941e
[4/5] KVM: selftests: Move page_align() to shared header
      commit: de00d07321cf3f182762de2308c08062d5b824c0
[5/5] KVM: selftests: Fix typos and stale comments in kvm_util
      commit: e0a99a2b72f3c6365d9f4d6943ed45f7fc286b70

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
