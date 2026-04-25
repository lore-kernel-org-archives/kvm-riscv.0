Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949CAFF8850
	for <kvm-riscv@archiver.kernel.org>; Sat, 25 Apr 2026 01:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/cpMNfssQhuhcnqqLhOhY5r8O48KeHCLPrfI+5cI2U=; b=UUsDy2NdsX50Hq
	YY8JFC+WVTQt9ubxTitVpdUv5+r9jaCe1r7+F8wnPvsvKz/5fztaLrsbKFGr7nO+9izF18Deh5oDV
	tgA30Y3EYfkWfiPFtvEsaCdps3tqu+YLsAb5kRVtWglDaJCzft5mtOXTDZPJF7ZYuHHYtmn3wg7uN
	onIdDkIY9qje9YJiv7jmSJ1ia9a+f+esW/0E4CRZo3Ns8XZKfAyns0mvm4dCerx0IHs8ZrMOnXD5b
	aFGYW/qK4on3u/WihYvTBrXtE6DmN1XiYQrOvHW+vz10MFIhI15kowgA3f6/PERNl1INpxxNWPzZg
	HKSBjuMPY/C4jt46JBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGRV2-0000000DxLj-10KH;
	Sat, 25 Apr 2026 01:08:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGRUz-0000000DxLM-0kO4;
	Sat, 25 Apr 2026 01:07:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C781842B04;
	Sat, 25 Apr 2026 01:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7A8C19425;
	Sat, 25 Apr 2026 01:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777079276;
	bh=v6TTWDx8y13lbMK9v0dMxzlyEZMB61u6UeeQLu+kS7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tlhtXKH0EVFKOmlfv1FSUM+pB992ZoOzPQvvQdkG9ATMCBSmxDqKSjCy2RxKOswqV
	 6UcnoCZfnEZ1j397uONDgWa6+8yhPN5WIvgmUio4ja9q6T8/m32ho7cngG5YcvJQNg
	 In75JQpWNI4/632P40A64yUbH2CiSr2BtKUo3EBuRZYVtZ29jOW3Hc2EK+tR24OMRA
	 pCmxvxsn3HnPvt/hS6AK7BJwTQDh0XTv4Ui8/xNDis6khjpVKeLnqqob64LjqShpPy
	 go/2aG04ydp2ndOYUt2F885tYnszBajCIMlmKn6rtvjoP6p7l7XdBwWToNZDTLtSsF
	 vSICW1jZ3te1Q==
From: guoren@kernel.org
To: anup@brainfault.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	cp0613@linux.alibaba.com,
	fangyu.yu@linux.alibaba.com,
	gaohan@iscas.ac.cn,
	guoren@kernel.org,
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
Date: Sat, 25 Apr 2026 01:07:41 +0000
Message-ID: <20260425010750.3322337-1-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAhSdy2RBs15ndXbUMs=k7fw8CH_5+b9k=+o6SNzxpvb-YKDig@mail.gmail.com>
References: <CAAhSdy2RBs15ndXbUMs=k7fw8CH_5+b9k=+o6SNzxpvb-YKDig@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_180757_229419_FBCF72A2 
X-CRM114-Status: UNSURE (   9.83  )
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
