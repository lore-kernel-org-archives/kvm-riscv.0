Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FBAFF8850
	for <kvm-riscv@archiver.kernel.org>; Sat, 25 Apr 2026 01:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/cpMNfssQhuhcnqqLhOhY5r8O48KeHCLPrfI+5cI2U=; b=y0+BRTRiHY1PJw
	Ir0HqTkaEACfGk+lNiZxqyZlcTcGQ7v9MBYMq1dRtVaDh+MuzOW0GWozvShG5EPMv6jKt3J5Cz6F0
	47ySdTwPupNC2xcGCglW5Cu2e1XlNj7umtHFZ/vxqpiyFiVhCRLyUNcwDkI4a9NDQYpQBcLHxIN3n
	I1sV4d5bcdqrJif3acadIRCsuRxQbicRiyMXG4TBme39D0GEGzpmoMG9/FqWu+D8sCR42GnQzQ50U
	Ywis2qELcPtDSdGy3UhEmC4tKX+ZSpX5iKcZiTS7hy9j4912dWPMzuVxS7+oaxA3GD35y5mLAbPgd
	43kUUP4nspcK8UmVlPhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGRTR-0000000DxCg-2Y35;
	Sat, 25 Apr 2026 01:06:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGRTP-0000000DxCI-3OJK;
	Sat, 25 Apr 2026 01:06:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C122043B0D;
	Sat, 25 Apr 2026 01:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20170C19425;
	Sat, 25 Apr 2026 01:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777079178;
	bh=v6TTWDx8y13lbMK9v0dMxzlyEZMB61u6UeeQLu+kS7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s6gMX2V91tEk1P5uAwjQg8ks2apnyaD7defQMsAgj4LngklvwnnMiGt8ZoJRTWek5
	 3LBjPHdQ8vgxc6lt14gCyF7Cz0tXpFtMHIpXJjeqwxS9GkWhTgqOdQT5NzCeOESjm5
	 F3/Dt0CX2Ln14Q+zl9TLA+M9dTOpjM7T8pgu5skqjn8yWuda1j0KhgUQjUk7cHer/u
	 BefQPh6K8RPa1hgkqzhfiyABJkLaOKSYbN8ib+iF3UBhfFBObY2IAAeYKR8UJqdUtW
	 lxq5jXc6fjkV7S3NCEROCNF1ySPIzXAOCTc1pEQhl8hE3l0vxC7dIfK3O89GrmPjBM
	 GxefZy0CGj1wA==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	cp0613@linux.alibaba.com,
	fangyu.yu@linux.alibaba.com,
	gaohan@iscas.ac.cn,
	inochiama@gmail.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	me@ziyao.cc,
	palmer@dabbelt.com,
	pjw@kernel.org,
	tglx@kernel.org
Subject: Re: Re: [PATCH 3/3] irqchip/riscv-imsic: Remove global nr_guest_files after KVM AIA per-HART conversion
Date: Sat, 25 Apr 2026 01:06:07 +0000
Message-ID: <20260425010611.3322320-1-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425005916.3321811-1-guoren@kernel.org>
References: <20260425005916.3321811-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_180619_867282_2B47DFCB 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

SGkgQW51cCwKCj4gT24gV2VkLCBBcHIgMjIsIDIwMjYgYXQgODozOeKAr0FNIEd1byBSZW4gPGd1
b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSBhbGwsCj4gPgo+ID4gVGhpcyBwYXRj
aCBzaW1wbHkgcmVtb3ZlZCBgbnJfZ3Vlc3RfZmlsZXNgLCB3aGljaCBpcyBzdWJvcHRpbWFsLiBG
b3IKPiA+IHYyLCBJIHdpbGwga2VlcCBgbnJfZ3Vlc3RfZmlsZXNgIGluc2lkZSBgc3RydWN0IGlt
c2ljX2xvY2FsX2NvbmZpZ2AKPiA+IChwZXItSEFSVCkgYW5kIGNvbXB1dGUgdGhlIGVmZmVjdGl2
ZSBIR0VJIGNvdW50IGluCj4gPiBga3ZtX3Jpc2N2X2FpYV9lbmFibGUoKWAgYXM6Cj4gPgo+ID4g
bWluKGhnY3RybC0+bnJfaGdlaSwgbGMtPm5yX2d1ZXN0X2ZpbGVzKQo+IAo+IFllcywgSSB3YXMg
Z29pbmcgdG8gY29tbWVudCB0aGUgZXhhY3Qgc2FtZSB0aGluZy4gR29vZCB0aGF0IHlvdQo+IHJl
YWxpemVkIGl0IGVhcmx5LgoKVGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2suIFRoaXMgaXMgVjI6
CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9rdm0tcmlzY3YvMjAyNjA0MjUwMDU5MTYuMzMyMTgx
MS0xLWd1b3JlbkBrZXJuZWwub3JnLwoKQmVzdCBSZWdhcmRzCiAgR1VPIFJlbgoKLS0gCmt2bS1y
aXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
