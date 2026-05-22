Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7249CD5BAF
	for <kvm-riscv@archiver.kernel.org>; Fri, 22 May 2026 03:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DX9slQNkS0kfOgpbSSE+COIR/H7BwUU0Tt+4QtNN4t8=; b=dYFeiey3iIaAfG
	FOjw6kupiuSTABS05tksS0gnQKRaA/HyqWPTXk8ruxyZxJ1jhS0Znn4t5nQZFXyz6SxYdYW2KK67K
	zbjgkVqraIPAyg+ppOYcn7UDxfBq81U2gUt/uZQHuJxsfKgXH+lstQTFL/nul6K5HXEZUQEj11aPa
	UqNAcRLXSTxHLW5W0QaYytkD0b3eBsMcDVymKmSB6xDIdPqbI9MQqr3anJ/CjhkSnviXOeepjmIbm
	6uS5mJODvMxli72ermXw1jLmz9m0cW8YF9da6zNyeKvE8Y6zF3lA2Tbo3GVtHa7aYekFtRm4CX0Yb
	CpJgwtgKeQUJdYCShNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGPB-00000009d1S-3LlO;
	Fri, 22 May 2026 03:18:33 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGP7-00000009d0l-2vF7;
	Fri, 22 May 2026 03:18:32 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAC3Sg71yg9qQQ0XEQ--.7414S2;
	Fri, 22 May 2026 11:18:13 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: andrew.jones@oss.qualcomm.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	jiakaiPeanut@gmail.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	xujiakai2025@iscas.ac.cn
Subject: Re: [PATCH] RISC-V: KVM: Fix TOCTOU race in SBI system suspend handler
Date: Fri, 22 May 2026 03:18:13 +0000
Message-Id: <20260522031813.3429490-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <yirnowpcfq6wqru3jshbbaicqftfj4ef3dcss65jdtuon6nzml@iyv45tnmmfha>
References: <yirnowpcfq6wqru3jshbbaicqftfj4ef3dcss65jdtuon6nzml@iyv45tnmmfha>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAC3Sg71yg9qQQ0XEQ--.7414S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr43Jw4rKw1rXw1ruw1Dtrb_yoW8JFy3pr
	Wjkw4xuw43GF1jq3yxJrW2qayjgrWrGa1UWwn5Cr1xXr15Cr1avr4xt3yY9ayIg3srZa42
	vrs0q34rCr4qvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JV
	WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbknY7UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCREPCWoPqqh6nAAAsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_201830_115830_9287BC8C 
X-CRM114-Status: GOOD (  11.37  )
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

SGksIGRyZXchCgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IQoKPiA+IEknbSBub3QgYSBiaWcgZmFu
IG9mIHRoaXMgYXBwcm9hY2ggYW5kIEkgc2VlIHNhc2hpa28gZm91bmQgaXQgaGFzIGdhcHNbMV0u
CgpJIHJlYWQgc2FzaGlrbydzIGZlZWRiYWNrIGFuZCBJIHRoaW5rIGl0IG1ha2VzIHNlbnNlLgoK
PiA+IEknZCByYXRoZXIgd2UgaW50cm9kdWNlIGEgbXV0ZXggdG8ga3ZtX2FyY2ggdG8gc2VyaWFs
aXplIGNyb3NzLXZjcHUKPiAKPiBFaCwgbm90IHN1cmUgd2h5IEkgc2FpZCAnaW50cm9kdWNlJyBo
ZXJlLiBXZSBjYW4ganVzdCB1c2Uga3ZtLT5sb2NrLgoKSSBsb29rZWQgaW50byB0aGF0LCBidXQg
aXQgbWF5IGJlIG5vdCBzdWl0YWJsZS4gSGVyZSdzIHdoeToKCkRvY3VtZW50YXRpb24vdmlydC9r
dm0vbG9ja2luZy5yc3QgZXhwbGljaXRseSBzdGF0ZXM6IGt2bS0+bG9jayBpcyB0YWtlbiAKb3V0
c2lkZSB2Y3B1LT5tdXRleC4gVGhlIHN1c3AgaGFuZGxlciBydW5zIGluc2lkZSBrdm1fYXJjaF92
Y3B1X2lvY3RsX3J1bigpLCAKd2hpY2ggaXMgY2FsbGVkIGZyb20ga3ZtX3ZjcHVfaW9jdGwoKSB3
aGVyZSB2Y3B1LT5tdXRleCBpcyBhbHJlYWR5IGhlbGQuCgpUYWtpbmcga3ZtLT5sb2NrIGluc2lk
ZSB0aGUgc3VzcCBoYW5kbGVyIHdvdWxkIHByb2R1Y2U6IHZjcHUtPm11dGV4IOKGkiBrdm0tPmxv
Y2suClNvIG1heSBiZSB3ZSBzaG91bGQgaW50cm9kdWNlIGEgbXV0ZXggdG8ga3ZtX2FyY2ggdG8g
c2VyaWFsaXplIGNyb3NzLXZjcHUKbXAtc3RhdGUgb3BlcmF0aW9ucy4KCldoYXQgZG8geW91IHRo
aW5rPwoKPiA+IG1wLXN0YXRlIG9wZXJhdGlvbnMuIFNvIGl0J2QgYmUgdGFrZW4gaW4gU1VTUCwg
SEFSVF9TVEFSVCwgYW5kIGFsc28gU1JTVAo+IAo+IEFuZCwgZXZlbiB0aG91Z2ggU1JTVCBkb2Vz
bid0IHJlYWxseSBuZWVkIGl0IC0gd2h5IG5vdC4uLiBDb25zaXN0ZW5jeSBoYXMKPiBpdHMgbWVy
aXRzLgo+IAo+ID4gKGFueXdoZXJlIHRoYXQgcmVhZHMgb3IgbW9kaWZpZXMgYW5vdGhlciB2Y3B1
J3MgbXAtc3RhdGUpLiBPcGVyYXRpb25zIHRoYXQKPiA+IG9ubHkgbW9kaWZ5IHRoZSBjYWxsaW5n
IHZjcHUncyBvd24gc3RhdGUgd291bGQgc3RpbGwgb25seSB1c2UgdGhlIHBlci12Y3B1Cj4gPiBt
cF9zdGF0ZV9sb2NrLgo+ID4gCj4gPiBbMV0gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwNTIxMTQyMDMwLjE1NjA4NjEtMS14dWppYWthaTIwMjUlNDBpc2Nhcy5hYy5jbgoKSSBh
Z3JlZSB3aXRoIHlvdS4KClJlZ2FyZHMsCkppYWthaQoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
