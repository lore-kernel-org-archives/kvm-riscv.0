Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB21DCA0FF2
	for <kvm-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gm54Z8+KyEZZaqvrdOtn/THngBe7MqdyNvEh9ryFZw8=; b=vMdxagBDUhDz2D
	Qd3lxB0xKNwZRo/GeASvf8lTZ35QW0476makhNvQFqWQhBxS+SB4q3EgAuoZf1dFvq7MWsHoNBFuP
	Z6OqORpta8psf57K8JxM5L47D0X46Gq0sQfm22eTP6Txu+4tT22YoGzD45goziZwoN6HEMoqlWoYD
	UViXF6sxrsf4vE/fyPZv26ILQe9HqtHoOfpAROIXBDdtnNrsGejCmjJThYQKIHOOgmtGAd1TQw71H
	sNk+LWePP/LZmAEZ4PHeJ+sxvatKwlh+TIyta5ju5lclmcC2vvb5NjcKyc2qyvdZbutn0CkGiEm/1
	Uxhp6TfgNyVShFCxerEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwYy-0000000Cdz4-2UsZ;
	Tue, 26 Aug 2025 16:30:24 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwYu-0000000CdyX-2hZ5;
	Tue, 26 Aug 2025 16:30:23 +0000
Received: from ROG.lan (unknown [118.251.176.199])
	by APP-03 (Coremail) with SMTP id rQCowAD3jX8L4a1oBKJmDw--.6398S2;
	Wed, 27 Aug 2025 00:30:05 +0800 (CST)
From: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	anup@brainfault.org,
	pbonzini@redhat.com,
	shuah@kernel.org,
	cyan.yang@sifive.com,
	cleger@rivosinc.com,
	charlie@rivosinc.com,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	namcao@linutronix.de,
	jesse@rivosinc.com,
	inochiama@gmail.com,
	yongxuan.wang@sifive.com,
	ajones@ventanamicro.com,
	parri.andrea@gmail.com,
	mikisabate@gmail.com,
	yikming2222@gmail.com,
	thomas.weissschuh@linutronix.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	pincheng.plct@isrc.iscas.ac.cn
Subject: [PATCH v2 0/5] Add Zilsd/Zclsd support in hwprobe and KVM
Date: Wed, 27 Aug 2025 00:29:34 +0800
Message-Id: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CM-TRANSID: rQCowAD3jX8L4a1oBKJmDw--.6398S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyftr1UXr48Cr1DJrW5Jrb_yoW8KrW5pF
	s5GwnI9r1kJw13CF1fAr48ur1rKan5uws3tF9xtw18WayayFyrZr10k3ZxZF1kAFZ29FyD
	Z3WrWryI9wnrAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjTRM6wCDUUUU
X-Originating-IP: [118.251.176.199]
X-CM-SenderInfo: pslquxhhqjh1xofwqxxvufhxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_093021_047166_FA0E7115 
X-CRM114-Status: UNSURE (   9.59  )
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

SGkgYWxsLAoKVGhpcyBpcyB2MiBvZiBhIHNob3J0IHNlcmllcyB0aGF0IGFkZHMga2VybmVsIHN1
cHBvcnQgZm9yIHRoZSByYXRpZmllZApaaWxzZCAoTG9hZC9TdG9yZSBwYWlyKSBhbmQgWmNsc2Qg
KENvbXByZXNzZWQgTG9hZC9TdG9yZSBwYWlyKSBSSVNDLVYKSVNBIGV4dGVuc2lvbnMuIFRoZSBz
ZXJpZXMgZW5hYmxlcyBrZXJuZWwtc2lkZSBleHBvc3VyZSBzbyB1c2VyLXNwYWNlCihmb3IgZXhh
bXBsZSBnbGliYykgY2FuIGRldGVjdCBhbmQgdXNlIHRoZXNlIGV4dGVuc2lvbnMgdmlhIGh3cHJv
YmUgYW5kCnJ1bnRpbWUgY2hlY2tzLgoKUGF0Y2hlczoKLSBQYXRjaCAx77yaQWRkIGRldmljZSB0
cmVlIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIFppbHNkIGFuZCBaY2xzZC4KLSBQYXRjaCAy
OiBFeHRlbmQgUklTQy1WIElTQSBleHRlbnNpb24gc3RyaW5nIHBhcnNpbmcgdG8gcmVjb2duaXpl
IHRoZW0uCi0gUGF0Y2ggMzogRXhwb3J0IFppbHNkIGFuZCBaY2xzZCB2aWEgcmlzY3ZfaHdwcm9i
ZS4KLSBQYXRjaCA0OiBBbGxvdyBLVk0gZ3Vlc3RzIHRvIHVzZSB0aGVtLgotIFBhdGNoIDU6IEFk
ZCBLVk0gc2VsZnRlc3RzLgoKQ2hhbmdlcyBpbiB2MjoKLSBEZXZpY2UtdHJlZSBzY2hlbWE6IHNp
bXBsaWZpZWQgdGhlIHJ2NjQgdmFsaWRhdGlvbiBmb3IgWmlsc2QgYnkKICByZW1vdmluZyBhIHJl
ZHVuZGFudCBgY29udGFpczogY29uc3Q6IHppbHNkYCBpbiB0aGUgYGlmYCBjbGF1c2U7IHRoZQog
IHNpbXBsZXIgYGlmIChyaXNjdiwgaXNhLWJhc2UgY29udGFpbnMgcnY2NGkpIHRoZW4gKHJpc2N2
LAogIGlzYS1leHRlbnNpb24gbm90IGNvbnRhaW5zIHppbHNkKWAgZm9ybSBpcyB1c2VkIGluc3Rl
YWQuIEJlaGF2aW91ciBpcwogIHVuY2hhbmdlZCwgYW5kIHRoZSBsb2dpYyBpcyBjbGVhbmVyLgot
IERldmljZS10cmVlIHNjaGVtYTogY29ycmVjdGVkIFpjbHNkIGRlcGVuZGVuY3kgdG8gcmVxdWly
ZSBib3RoIFppbHNkCiAgYW5kIFpjYSAocHJldmlvdXMgYGFueU9mYCB3YXMgaW5jb3JyZWN0OyBu
b3cgYm90aCBhcmUgZW5mb3JjZWQpLgotIENvbW1pdCBtZXNzYWdlIHR5cG8gZml4ZWQ6ICJkdC1i
aWRpbmdzIiAtPiAiZHQtYmluZGluZ3MiIGluIHRoZSBQYXRjaAogIDEgY29tbWl0IHN1YmplY3Qu
CgpUaGUgdjIgY2hhbmdlcyBhcmUgZG9jdW1lbnRhdGlvbi9zY2hlbWEgY29ycmVjdGlvbnMgaW4g
ZXh0ZW5zaW9ucy55YW1sLgpObyBmdW5jdGlvbmFsIGNoYW5nZXMgd2VyZSBtYWRlIHRvIElTQSBw
YXJzaW5nLCBod3Byb2JlIHN5c2NhbGwsIEtWTQpndWVzdCBzdXBwb3J0IG9yIHRoZSBzZWxmdGVz
dHMgYmV5b25kIGVuc3VyaW5nIHRoZSBiaW5kaW5nIGNvcnJlY3RseQpkb2N1bWVudHMgYW5kIHZh
bGlkYXRlcyB0aGUgZXh0ZW5zaW9uIHJlbGF0aW9uc2hpcHMuCgpQbGVhc2UgcmV2aWV3IHYyIGFu
ZCBhZHZpc2UgaWYgZnV0aGVyIGNoYW5nZXMgYXJlIG5lZWRlZC4KClRoYW5rcywKUGluY2hlbmcg
V2FuZyAKClBpbmNoZW5nIFdhbmcgKDUpOgogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFppbHNk
IGFuZCBaY2xzZCBleHRlbnNpb24gZGVzY3JpcHRpb25zCiAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5z
aW9uIHBhcnNpbmcgZm9yIFppbHNkIGFuZCBaY2xzZAogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQg
Wmlsc2QgYW5kIFpjbHNkIElTQSBleHRlbnNpb25zCiAgcmlzY3Y6IEtWTTogYWxsb3cgWmlsc2Qg
YW5kIFpjbHNkIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNCiAgS1ZNOiByaXNjdjogc2VsZnRlc3Rz
OiBhZGQgWmlsc2QgYW5kIFpjbHNkIGV4dGVuc2lvbiB0byBnZXQtcmVnLWxpc3QKICAgIHRlc3QK
CiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgICAgfCAgOCArKysr
KwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgMzYgKysr
KysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgICAg
ICAgICAgIHwgIDIgKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggICAg
ICAgICB8ICAyICsrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggICAgICAgICAg
ICAgfCAgMiArKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAg
IHwgMjQgKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAg
ICAgICAgICAgIHwgIDIgKysKIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICAgICAg
ICAgICAgICB8ICAyICsrCiAuLi4vc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAg
ICAgICAgfCAgNiArKysrCiA5IGZpbGVzIGNoYW5nZWQsIDg0IGluc2VydGlvbnMoKykKCi0tIAoy
LjM5LjUKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
