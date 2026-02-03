Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D68CE7FDFA
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 00:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ei+IyUAuKC/l45taGO781yLi4RoW1VG2oPlXt9or/hs=; b=bZXK0sxC8mQfuQ
	EqJ0YLoO4sOdCnJv/R8OJzVELbg/uARecf3WIBLIS2dgm112j1/4kR0cTI/NGwssT0C0LFGznceWz
	JPv20vnjO1MYoaTIFtAPT+AxsOsu/3OAM5Fthpciwky9rRGxM8j6YKiCcCSQM4Z8Xz5/jT4OHm796
	XSNEM7OEIFviB9NejImpueVzpdy57TOB9n4YHFx9Esp+2uP2bfz8RSs2amMpcqa75rKQb+qQUQ038
	GEzaNvkZRxhh+dbAoEyW8QrIiDycpc/tQCqA4Zg53GajXkJE5FHwkDNjMqynJGe9k7dlim6xXw0Om
	JOAk7R7fxV2Mgq4cDaNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4le-00000005pDM-1KDy;
	Tue, 03 Feb 2026 00:59:46 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4lZ-00000005pD0-3t3n;
	Tue, 03 Feb 2026 00:59:44 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowADX9NtsSIFpjCORBw--.35218S2;
	Tue, 03 Feb 2026 08:59:25 +0800 (CST)
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
Subject: Re: [PATCH v5] RISC-V: KVM: Validate SBI STA shmem alignment in 
Date: Tue,  3 Feb 2026 00:59:24 +0000
Message-Id: <20260203005924.2144673-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <h5ywmsqp2eysyslvh7zmuiw3mzthkiilgqv4gvjvpl6nejxs7m@ahjmnsz2c2x3>
References: <h5ywmsqp2eysyslvh7zmuiw3mzthkiilgqv4gvjvpl6nejxs7m@ahjmnsz2c2x3>
MIME-Version: 1.0
X-CM-TRANSID: rQCowADX9NtsSIFpjCORBw--.35218S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYN7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2js
	IEc7CjxVAFwI0_Cr1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvE
	ncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I
	8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I2
	1c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI4
	8JMxAqzxv26xkF7I0En4kS14v26r1q6r43MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7V
	UbHa0DUUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBwwHCWmAvVDsXgAAsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_165942_335645_17238898 
X-CRM114-Status: UNSURE (   4.70  )
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

SGkgZHJldywKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGllbnQgcmV2aWV3LCBJIHJlYWxseSBhcHBy
ZWNpYXRlIGl0LgoKSSBhZ3JlZSB3aXRoIHlvdXIgY29tbWVudHMgb24gaW5pdGlhbGl6aW5nIG5l
d19zaG1lbSB0byBJTlZBTElEX0dQQSBhbmQgCm9uIGltcHJvdmluZyBjb3ZlcmFnZSB3aXRoIGtz
ZWxmdGVzdHMuIEnigJlsbCB3YWl0IGEgY291cGxlIG9mIGRheXMgdG8gCnNlZSBpZiB0aGVyZSBh
cmUgYWRkaXRpb25hbCBjb21tZW50cyBmcm9tIG90aGVyIHJldmlld2VycywgYW5kIHRoZW4gCnNl
bmQgYW4gdXBkYXRlZCByZXZpc2lvbiB0aGF0IGluY29ycG9yYXRlcyB0aGUgZmVlZGJhY2suCgpU
aGFua3MgYWdhaW4gZm9yIHlvdXIgcmV2aWV3LgoKQmVzdCByZWdhcmRzLApKaWFrYWkgWHUKCgot
LSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
