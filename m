Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD81EC145A
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 14:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zlv/Dgc5QqiYVIMAyldDzkzIcYDteLB84YNOlWBW6SY=; b=eXWZyDNOKCJwEZ
	UFnXNAwe1JVsbhhASuJ/QDJv/S/ztg/yQMvjRo3hFA/p0SPmI0LM4ujxmojSsQ+6ZDNJg5qSB+2cO
	HSFGJIw1d2qbzOlNK0YCm+ocqQnd036QyitjOXQKvVbECebCJtiVKcAkOJctw4N+wb6+834amVRLa
	MjNhs6KPr0kjLgM/mpF8rhSlOoBjMc2z8iSKAUNspB37V4KJn54EGUWxAy2PIX/ZcdCxNNOWTzxaR
	wwlQPwJcSnpmL3IQq4Fs178T+i2rEtBIbqqeVf2nt37+QHvlRtCqGFC6SsWr2tCrE1UT01mlt5s59
	kunIS6v2JD/sT2yYkyiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQbT-0000000FJH4-45n7;
	Tue, 03 Mar 2026 14:20:03 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQbP-0000000FJD3-49PA;
	Tue, 03 Mar 2026 14:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=CC:To:In-Reply-To:References:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+0uYMpZbsgaMKEIZnZgI88fnqM5GbA0UO9KY1vw0gjA=; b=EBVS+NlzRtcZ4E+eQClFKUQtX8
	1t+c+PlLot5fCoWxRwUO7nyYWyf51x90+R5uF12XcDXeRq2pM6xvFcy2AP1fd41K2HUeya14IvhCM
	Rvk9c6bSu5KjHYwDAuOGan9H0IGndWO5Y5qAGnCFoKUGMB08yTA1KftI8qQuKftNzyzp1ONMz3q/r
	ccANOmndKUSkX7zvjfYCitHc6T4V39UP4j/6ux+19NvAqcJxh93y1M8YxfBz/MhQnEAbuCSBdzjtH
	aJniGVA01jhnRSBdFxmCPhxbLY0a9ZV0L+yybSt5NGPUvd4qYVYOC3S/LWS4pF29chI0rCoKckl1Y
	7gLDMDpQ==;
Received: from mailer.gwdg.de ([134.76.10.26]:36952)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vxQb9-00850c-1k;
	Tue, 03 Mar 2026 15:19:44 +0100
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vxQbA-0006kx-0w;
	Tue, 03 Mar 2026 15:19:44 +0100
Received: from lukass-mbp-7.lan (10.250.9.200) by MBX19-SUB-05.um.gwdg.de
 (10.108.142.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Tue, 3 Mar
 2026 15:19:43 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
Date: Tue, 3 Mar 2026 15:19:44 +0100
Subject: [PATCH v2 4/4] KVM: riscv: Fix Spectre-v1 in PMU counter access
MIME-Version: 1.0
Message-ID: <20260303-kvm-riscv-spectre-v1-v2-4-192caab8e0dc@cispa.de>
References: <20260303-kvm-riscv-spectre-v1-v2-0-192caab8e0dc@cispa.de>
In-Reply-To: <20260303-kvm-riscv-spectre-v1-v2-0-192caab8e0dc@cispa.de>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones
	<ajones@ventanamicro.com>
CC: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Daniel
 Weber <daniel.weber@cispa.de>, Michael Schwarz <michael.schwarz@cispa.de>,
	Marton Bognar <marton.bognar@kuleuven.be>, Jo Van Bulck
	<jo.vanbulck@kuleuven.be>, Lukas Gerlach <lukas.gerlach@cispa.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3343;
 i=lukas.gerlach@cispa.de; h=from:subject:message-id;
 bh=KM1k/pQ3/foiyLLSfk5MnnCFsDCB/OLME+w81duj1l4=;
 b=owGbwMvMwCGWoTIjqP/42kTG02pJDJnL3v5LFkybm1cn++/BAa0/yy6plymyz2XsiHav9FCs7
 F00VV+no5SFQYyDQVZMkWWq4GvGvj0OPEmZh8/BzGFlAhnCwMUpABPpVGP4K3bE+fdtt5DF//PS
 FCKMdr14WR1mWraSv2Lzx/O/Y7sOFjL891YXFWVRiuje7OpjffjZfD8OH76yFT8uBJya9/Xeibf
 JPAA=
X-Developer-Key: i=lukas.gerlach@cispa.de; a=openpgp;
 fpr=9511EB018EBC400C6269C3CE682498528FC7AD61
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-SUB-05.um.gwdg.de (10.108.142.70) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_062000_055364_6458BF96 
X-CRM114-Status: GOOD (  11.30  )
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

R3Vlc3QtY29udHJvbGxlZCBjb3VudGVyIGluZGljZXMgcmVjZWl2ZWQgdmlhIFNCSSBlY2FsbHMg
YXJlIHVzZWQgdG8KaW5kZXggaW50byB0aGUgUE1DIGFycmF5LiBTYW5pdGl6ZSB0aGVtIHdpdGgg
YXJyYXlfaW5kZXhfbm9zcGVjKCkKdG8gcHJldmVudCBzcGVjdWxhdGl2ZSBvdXQtb2YtYm91bmRz
IGFjY2Vzcy4KClNpbWlsYXIgdG8geDg2IGNvbW1pdCAxM2M1MTgzYTRlNjQgKCJLVk06IHg4Njog
UHJvdGVjdCBNU1ItYmFzZWQKaW5kZXggY29tcHV0YXRpb25zIGluIHBtdS5oIGZyb20gU3BlY3Ry
ZS12MS9MMVRGIGF0dGFja3MiKS4KCkZpeGVzOiA4ZjAxNTNlY2QzYmYgKCJSSVNDLVY6IEtWTTog
QWRkIHNrZWxldG9uIHN1cHBvcnQgZm9yIHBlcmYiKQpSZXZpZXdlZC1ieTogUmFkaW0gS3LEjW3D
ocWZIDxyYWRpbS5rcmNtYXJAb3NzLnF1YWxjb21tLmNvbT4KU2lnbmVkLW9mZi1ieTogTHVrYXMg
R2VybGFjaCA8bHVrYXMuZ2VybGFjaEBjaXNwYS5kZT4KLS0tCiBhcmNoL3Jpc2N2L2t2bS92Y3B1
X3BtdS5jIHwgMTQgKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCmluZGV4IDRkOGQ1ZTlhYTUzZC4uMGQ2MjZm
NjdkMDhmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCisrKyBiL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfcG11LmMKQEAgLTEwLDYgKzEwLDcgQEAKICNpbmNsdWRlIDxsaW51eC9l
cnJuby5oPgogI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgogI2luY2x1ZGUgPGxpbnV4L2t2bV9ob3N0
Lmg+CisjaW5jbHVkZSA8bGludXgvbm9zcGVjLmg+CiAjaW5jbHVkZSA8bGludXgvcGVyZi9yaXNj
dl9wbXUuaD4KICNpbmNsdWRlIDxhc20vY3NyLmg+CiAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3Ni
aS5oPgpAQCAtODcsNyArODgsOCBAQCBzdGF0aWMgdm9pZCBrdm1fcG11X3JlbGVhc2VfcGVyZl9l
dmVudChzdHJ1Y3Qga3ZtX3BtYyAqcG1jKQogCiBzdGF0aWMgdTY0IGt2bV9wbXVfZ2V0X3BlcmZf
ZXZlbnRfaHdfY29uZmlnKHUzMiBzYmlfZXZlbnRfY29kZSkKIHsKLQlyZXR1cm4gaHdfZXZlbnRf
cGVyZl9tYXBbc2JpX2V2ZW50X2NvZGVdOworCXJldHVybiBod19ldmVudF9wZXJmX21hcFthcnJh
eV9pbmRleF9ub3NwZWMoc2JpX2V2ZW50X2NvZGUsCisJCQkJCQkgICAgU0JJX1BNVV9IV19HRU5F
UkFMX01BWCldOwogfQogCiBzdGF0aWMgdTY0IGt2bV9wbXVfZ2V0X3BlcmZfZXZlbnRfY2FjaGVf
Y29uZmlnKHUzMiBzYmlfZXZlbnRfY29kZSkKQEAgLTIxOCw2ICsyMjAsNyBAQCBzdGF0aWMgaW50
IHBtdV9md19jdHJfcmVhZF9oaShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcg
Y2lkeCwKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCisJY2lkeCA9IGFycmF5X2luZGV4X25vc3Bl
YyhjaWR4LCBSSVNDVl9LVk1fTUFYX0NPVU5URVJTKTsKIAlwbWMgPSAma3ZwbXUtPnBtY1tjaWR4
XTsKIAogCWlmIChwbWMtPmNpbmZvLnR5cGUgIT0gU0JJX1BNVV9DVFJfVFlQRV9GVykKQEAgLTI0
NCw2ICsyNDcsNyBAQCBzdGF0aWMgaW50IHBtdV9jdHJfcmVhZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHVuc2lnbmVkIGxvbmcgY2lkeCwKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCisJY2lkeCA9
IGFycmF5X2luZGV4X25vc3BlYyhjaWR4LCBSSVNDVl9LVk1fTUFYX0NPVU5URVJTKTsKIAlwbWMg
PSAma3ZwbXUtPnBtY1tjaWR4XTsKIAogCWlmIChwbWMtPmNpbmZvLnR5cGUgPT0gU0JJX1BNVV9D
VFJfVFlQRV9GVykgewpAQCAtNTI1LDYgKzUyOSw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9wbXVf
Y3RyX2luZm8oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGNpZHgsCiAJCXJl
dHVybiAwOwogCX0KIAorCWNpZHggPSBhcnJheV9pbmRleF9ub3NwZWMoY2lkeCwgUklTQ1ZfS1ZN
X01BWF9DT1VOVEVSUyk7CiAJcmV0ZGF0YS0+b3V0X3ZhbCA9IGt2cG11LT5wbWNbY2lkeF0uY2lu
Zm8udmFsdWU7CiAKIAlyZXR1cm4gMDsKQEAgLTU1OSw3ICs1NjQsOCBAQCBpbnQga3ZtX3Jpc2N2
X3ZjcHVfcG11X2N0cl9zdGFydChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcg
Y3RyX2Jhc2UsCiAJfQogCS8qIFN0YXJ0IHRoZSBjb3VudGVycyB0aGF0IGhhdmUgYmVlbiBjb25m
aWd1cmVkIGFuZCByZXF1ZXN0ZWQgYnkgdGhlIGd1ZXN0ICovCiAJZm9yX2VhY2hfc2V0X2JpdChp
LCAmY3RyX21hc2ssIFJJU0NWX01BWF9DT1VOVEVSUykgewotCQlwbWNfaW5kZXggPSBpICsgY3Ry
X2Jhc2U7CisJCXBtY19pbmRleCA9IGFycmF5X2luZGV4X25vc3BlYyhpICsgY3RyX2Jhc2UsCisJ
CQkJCSAgICAgICBSSVNDVl9LVk1fTUFYX0NPVU5URVJTKTsKIAkJaWYgKCF0ZXN0X2JpdChwbWNf
aW5kZXgsIGt2cG11LT5wbWNfaW5fdXNlKSkKIAkJCWNvbnRpbnVlOwogCQkvKiBUaGUgZ3Vlc3Qg
c3RhcnRlZCB0aGUgY291bnRlciBhZ2Fpbi4gUmVzZXQgdGhlIG92ZXJmbG93IHN0YXR1cyAqLwpA
QCAtNjMwLDcgKzYzNiw4IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9wbXVfY3RyX3N0b3Aoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGN0cl9iYXNlLAogCiAJLyogU3RvcCB0aGUg
Y291bnRlcnMgdGhhdCBoYXZlIGJlZW4gY29uZmlndXJlZCBhbmQgcmVxdWVzdGVkIGJ5IHRoZSBn
dWVzdCAqLwogCWZvcl9lYWNoX3NldF9iaXQoaSwgJmN0cl9tYXNrLCBSSVNDVl9NQVhfQ09VTlRF
UlMpIHsKLQkJcG1jX2luZGV4ID0gaSArIGN0cl9iYXNlOworCQlwbWNfaW5kZXggPSBhcnJheV9p
bmRleF9ub3NwZWMoaSArIGN0cl9iYXNlLAorCQkJCQkgICAgICAgUklTQ1ZfS1ZNX01BWF9DT1VO
VEVSUyk7CiAJCWlmICghdGVzdF9iaXQocG1jX2luZGV4LCBrdnBtdS0+cG1jX2luX3VzZSkpCiAJ
CQljb250aW51ZTsKIAkJcG1jID0gJmt2cG11LT5wbWNbcG1jX2luZGV4XTsKQEAgLTc2MSw2ICs3
NjgsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9jZmdfbWF0Y2goc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGN0cl9iYQogCQl9CiAJfQogCisJY3RyX2lkeCA9IGFy
cmF5X2luZGV4X25vc3BlYyhjdHJfaWR4LCBSSVNDVl9LVk1fTUFYX0NPVU5URVJTKTsKIAlwbWMg
PSAma3ZwbXUtPnBtY1tjdHJfaWR4XTsKIAlwbWMtPmlkeCA9IGN0cl9pZHg7CiAKCi0tIAoyLjUx
LjAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
