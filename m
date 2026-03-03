Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12D3EC145A
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 14:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLTvO9CxtrqzqsInG6us29oMi5dyHytYXxtyKk0nbAg=; b=d/0PRWSn1Ooza5
	aL4Ac2WPtJ76QS4m5UC//ZPAATnAsTjy78Zb7ba5oOTwAenC+BD9BzFoCcVtu6botuahmOkrvd5Q6
	1Opd57KEbQky+9XpS5h9JgeTWbpHPa0hNFhkGOOKKDYZj1WjGQr0TBTXsRH9XoGQv/3XTHMTcfkpN
	jTddr69zDXuvP3Y9vx/ap3r1O/Aznq2tbHBdP7qkVB4g0Z0oltaC8AuUL8j2wdmxtyf8G4Pzmlutu
	/quynBM6M/bIia+J7G9vJ1JtTZGjwoYyjs5qkEe1JXptM+/9XyHk2I65dJJGDJaXvVAvMkid4SRla
	UnO+f73iD02FPiiftrQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQbX-0000000FJKR-26sa;
	Tue, 03 Mar 2026 14:20:07 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQbQ-0000000FJD1-1Pjw;
	Tue, 03 Mar 2026 14:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=CC:To:In-Reply-To:References:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2BcOjrNpCibrOdJLkBqx5P6cXuCy4qWNPIEqtnNoka0=; b=bx+XtFRck2NQYURZKzj0Pu2TPi
	ZJde3H6huowlW8yvSMUd+iaAII9CdNbcoafI4Qo2vxxXsbbc/8YBXARPdRypNtboYEx5fCGOkQCpA
	eB79fToU8cjQzHGxqzhX5BshdYf6S3V8kdpRrvnGGLrbNaATe7XPRBMPcpt2Ugp+MbJB23WwaCNNg
	Mq2RmEje/nu2X/6jZ0D8is7iwq6vzAlgdsPDu5fS2haIyUgaDcEA2cRelW8ASqOtRVpsvLTCprNoc
	LYuw6SBSB331PqMNqsjYUUMo+6V5+Xzg3g7qD73Mt9XKNqla7JxL9xmRUcIS51d/p2Uy/4yUnSoi8
	7+nxWVkQ==;
Received: from mailer.gwdg.de ([134.76.10.26]:44405)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vxQb8-00850J-11;
	Tue, 03 Mar 2026 15:19:43 +0100
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vxQb9-0006kE-0D;
	Tue, 03 Mar 2026 15:19:43 +0100
Received: from lukass-mbp-7.lan (10.250.9.200) by MBX19-SUB-05.um.gwdg.de
 (10.108.142.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Tue, 3 Mar
 2026 15:19:42 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
Date: Tue, 3 Mar 2026 15:19:41 +0100
Subject: [PATCH v2 1/4] KVM: riscv: Fix Spectre-v1 in ONE_REG register
 access
MIME-Version: 1.0
Message-ID: <20260303-kvm-riscv-spectre-v1-v2-1-192caab8e0dc@cispa.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4830;
 i=lukas.gerlach@cispa.de; h=from:subject:message-id;
 bh=j5JRn8BDxWYEk9Bob09tmUeE0dFdl/ufaymZCcn8CKk=;
 b=owGbwMvMwCGWoTIjqP/42kTG02pJDJnL3v5dkqdzp0c7IKDp3yTmhGlzJ53VWHqdd8/mA3Ibc
 oSPZ67+1FHKwiDGwSArpsgyVfA1Y98eB56kzMPnYOawMoEMYeDiFICJnGZjZDgldNGT/dFhs6gj
 7Du3/XynX7Hn9R9lrt5uSe5Hy6o+309kZPi3SNwklPu9y+6G4mX1Ux+4fi68LBQ5/a54+y3vIN6
 GXAYA
X-Developer-Key: i=lukas.gerlach@cispa.de; a=openpgp;
 fpr=9511EB018EBC400C6269C3CE682498528FC7AD61
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-SUB-05.um.gwdg.de (10.108.142.70) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_062000_606044_689CDA57 
X-CRM114-Status: GOOD (  10.53  )
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

VXNlci1jb250cm9sbGVkIHJlZ2lzdGVyIGluZGljZXMgZnJvbSB0aGUgT05FX1JFRyBpb2N0bCBh
cmUgdXNlZCB0bwppbmRleCBpbnRvIGFycmF5cyBvZiByZWdpc3RlciB2YWx1ZXMuIFNhbml0aXpl
IHRoZW0gd2l0aAphcnJheV9pbmRleF9ub3NwZWMoKSB0byBwcmV2ZW50IHNwZWN1bGF0aXZlIG91
dC1vZi1ib3VuZHMgYWNjZXNzLgoKUmV2aWV3ZWQtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0u
a3JjbWFyQG9zcy5xdWFsY29tbS5jb20+ClNpZ25lZC1vZmYtYnk6IEx1a2FzIEdlcmxhY2ggPGx1
a2FzLmdlcmxhY2hAY2lzcGEuZGU+Ci0tLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyB8
IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDI4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9vbmVyZWcuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKaW5kZXgg
ZTdhYjZjYjAwNjQ2Li5hNGM4NzAzYTk2YTkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfb25lcmVnLmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwpAQCAtMTAsNiAr
MTAsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2JpdG9wcy5oPgogI2luY2x1ZGUgPGxpbnV4L2Vycm5v
Lmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+CisjaW5jbHVkZSA8bGludXgvbm9zcGVjLmg+CiAj
aW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgogI2luY2x1ZGUgPGxpbnV4L2t2bV9ob3N0Lmg+CiAj
aW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KQEAgLTEyNyw2ICsxMjgsNyBAQCBzdGF0aWMgaW50
IGt2bV9yaXNjdl92Y3B1X2lzYV9jaGVja19ob3N0KHVuc2lnbmVkIGxvbmcga3ZtX2V4dCwgdW5z
aWduZWQgbG9uZyAqZwogCSAgICBrdm1fZXh0ID49IEFSUkFZX1NJWkUoa3ZtX2lzYV9leHRfYXJy
KSkKIAkJcmV0dXJuIC1FTk9FTlQ7CiAKKwlrdm1fZXh0ID0gYXJyYXlfaW5kZXhfbm9zcGVjKGt2
bV9leHQsIEFSUkFZX1NJWkUoa3ZtX2lzYV9leHRfYXJyKSk7CiAJKmd1ZXN0X2V4dCA9IGt2bV9p
c2FfZXh0X2Fycltrdm1fZXh0XTsKIAlzd2l0Y2ggKCpndWVzdF9leHQpIHsKIAljYXNlIFJJU0NW
X0lTQV9FWFRfU01OUE06CkBAIC00NDMsMTMgKzQ0NSwxNiBAQCBzdGF0aWMgaW50IGt2bV9yaXNj
dl92Y3B1X2dldF9yZWdfY29yZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJdW5zaWduZWQgbG9u
ZyByZWdfbnVtID0gcmVnLT5pZCAmIH4oS1ZNX1JFR19BUkNIX01BU0sgfAogCQkJCQkgICAgS1ZN
X1JFR19TSVpFX01BU0sgfAogCQkJCQkgICAgS1ZNX1JFR19SSVNDVl9DT1JFKTsKKwl1bnNpZ25l
ZCBsb25nIHJlZ3NfbWF4ID0gc2l6ZW9mKHN0cnVjdCBrdm1fcmlzY3ZfY29yZSkgLyBzaXplb2Yo
dW5zaWduZWQgbG9uZyk7CiAJdW5zaWduZWQgbG9uZyByZWdfdmFsOwogCiAJaWYgKEtWTV9SRUdf
U0laRShyZWctPmlkKSAhPSBzaXplb2YodW5zaWduZWQgbG9uZykpCiAJCXJldHVybiAtRUlOVkFM
OwotCWlmIChyZWdfbnVtID49IHNpemVvZihzdHJ1Y3Qga3ZtX3Jpc2N2X2NvcmUpIC8gc2l6ZW9m
KHVuc2lnbmVkIGxvbmcpKQorCWlmIChyZWdfbnVtID49IHJlZ3NfbWF4KQogCQlyZXR1cm4gLUVO
T0VOVDsKIAorCXJlZ19udW0gPSBhcnJheV9pbmRleF9ub3NwZWMocmVnX251bSwgcmVnc19tYXgp
OworCiAJaWYgKHJlZ19udW0gPT0gS1ZNX1JFR19SSVNDVl9DT1JFX1JFRyhyZWdzLnBjKSkKIAkJ
cmVnX3ZhbCA9IGNudHgtPnNlcGM7CiAJZWxzZSBpZiAoS1ZNX1JFR19SSVNDVl9DT1JFX1JFRyhy
ZWdzLnBjKSA8IHJlZ19udW0gJiYKQEAgLTQ3NiwxMyArNDgxLDE2IEBAIHN0YXRpYyBpbnQga3Zt
X3Jpc2N2X3ZjcHVfc2V0X3JlZ19jb3JlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAl1bnNpZ25l
ZCBsb25nIHJlZ19udW0gPSByZWctPmlkICYgfihLVk1fUkVHX0FSQ0hfTUFTSyB8CiAJCQkJCSAg
ICBLVk1fUkVHX1NJWkVfTUFTSyB8CiAJCQkJCSAgICBLVk1fUkVHX1JJU0NWX0NPUkUpOworCXVu
c2lnbmVkIGxvbmcgcmVnc19tYXggPSBzaXplb2Yoc3RydWN0IGt2bV9yaXNjdl9jb3JlKSAvIHNp
emVvZih1bnNpZ25lZCBsb25nKTsKIAl1bnNpZ25lZCBsb25nIHJlZ192YWw7CiAKIAlpZiAoS1ZN
X1JFR19TSVpFKHJlZy0+aWQpICE9IHNpemVvZih1bnNpZ25lZCBsb25nKSkKIAkJcmV0dXJuIC1F
SU5WQUw7Ci0JaWYgKHJlZ19udW0gPj0gc2l6ZW9mKHN0cnVjdCBrdm1fcmlzY3ZfY29yZSkgLyBz
aXplb2YodW5zaWduZWQgbG9uZykpCisJaWYgKHJlZ19udW0gPj0gcmVnc19tYXgpCiAJCXJldHVy
biAtRU5PRU5UOwogCisJcmVnX251bSA9IGFycmF5X2luZGV4X25vc3BlYyhyZWdfbnVtLCByZWdz
X21heCk7CisKIAlpZiAoY29weV9mcm9tX3VzZXIoJnJlZ192YWwsIHVhZGRyLCBLVk1fUkVHX1NJ
WkUocmVnLT5pZCkpKQogCQlyZXR1cm4gLUVGQVVMVDsKIApAQCAtNTA3LDEwICs1MTUsMTMgQEAg
c3RhdGljIGludCBrdm1fcmlzY3ZfdmNwdV9nZW5lcmFsX2dldF9jc3Ioc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LAogCQkJCQkgIHVuc2lnbmVkIGxvbmcgKm91dF92YWwpCiB7CiAJc3RydWN0IGt2bV92
Y3B1X2NzciAqY3NyID0gJnZjcHUtPmFyY2guZ3Vlc3RfY3NyOworCXVuc2lnbmVkIGxvbmcgcmVn
c19tYXggPSBzaXplb2Yoc3RydWN0IGt2bV9yaXNjdl9jc3IpIC8gc2l6ZW9mKHVuc2lnbmVkIGxv
bmcpOwogCi0JaWYgKHJlZ19udW0gPj0gc2l6ZW9mKHN0cnVjdCBrdm1fcmlzY3ZfY3NyKSAvIHNp
emVvZih1bnNpZ25lZCBsb25nKSkKKwlpZiAocmVnX251bSA+PSByZWdzX21heCkKIAkJcmV0dXJu
IC1FTk9FTlQ7CiAKKwlyZWdfbnVtID0gYXJyYXlfaW5kZXhfbm9zcGVjKHJlZ19udW0sIHJlZ3Nf
bWF4KTsKKwogCWlmIChyZWdfbnVtID09IEtWTV9SRUdfUklTQ1ZfQ1NSX1JFRyhzaXApKSB7CiAJ
CWt2bV9yaXNjdl92Y3B1X2ZsdXNoX2ludGVycnVwdHModmNwdSk7CiAJCSpvdXRfdmFsID0gKGNz
ci0+aHZpcCA+PiBWU0lQX1RPX0hWSVBfU0hJRlQpICYgVlNJUF9WQUxJRF9NQVNLOwpAQCAtNTI2
LDEwICs1MzcsMTMgQEAgc3RhdGljIGludCBrdm1fcmlzY3ZfdmNwdV9nZW5lcmFsX3NldF9jc3Io
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJCQkgIHVuc2lnbmVkIGxvbmcgcmVnX3ZhbCkKIHsK
IAlzdHJ1Y3Qga3ZtX3ZjcHVfY3NyICpjc3IgPSAmdmNwdS0+YXJjaC5ndWVzdF9jc3I7CisJdW5z
aWduZWQgbG9uZyByZWdzX21heCA9IHNpemVvZihzdHJ1Y3Qga3ZtX3Jpc2N2X2NzcikgLyBzaXpl
b2YodW5zaWduZWQgbG9uZyk7CiAKLQlpZiAocmVnX251bSA+PSBzaXplb2Yoc3RydWN0IGt2bV9y
aXNjdl9jc3IpIC8gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpKQorCWlmIChyZWdfbnVtID49IHJlZ3Nf
bWF4KQogCQlyZXR1cm4gLUVOT0VOVDsKIAorCXJlZ19udW0gPSBhcnJheV9pbmRleF9ub3NwZWMo
cmVnX251bSwgcmVnc19tYXgpOworCiAJaWYgKHJlZ19udW0gPT0gS1ZNX1JFR19SSVNDVl9DU1Jf
UkVHKHNpcCkpIHsKIAkJcmVnX3ZhbCAmPSBWU0lQX1ZBTElEX01BU0s7CiAJCXJlZ192YWwgPDw9
IFZTSVBfVE9fSFZJUF9TSElGVDsKQEAgLTU0OCwxMSArNTYyLDE0IEBAIHN0YXRpYyBpbmxpbmUg
aW50IGt2bV9yaXNjdl92Y3B1X3Ntc3RhdGVlbl9zZXRfY3NyKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwKIAkJCQkJCSAgIHVuc2lnbmVkIGxvbmcgcmVnX3ZhbCkKIHsKIAlzdHJ1Y3Qga3ZtX3ZjcHVf
c21zdGF0ZWVuX2NzciAqY3NyID0gJnZjcHUtPmFyY2guc21zdGF0ZWVuX2NzcjsKKwl1bnNpZ25l
ZCBsb25nIHJlZ3NfbWF4ID0gc2l6ZW9mKHN0cnVjdCBrdm1fcmlzY3Zfc21zdGF0ZWVuX2Nzcikg
LworCQlzaXplb2YodW5zaWduZWQgbG9uZyk7CiAKLQlpZiAocmVnX251bSA+PSBzaXplb2Yoc3Ry
dWN0IGt2bV9yaXNjdl9zbXN0YXRlZW5fY3NyKSAvCi0JCXNpemVvZih1bnNpZ25lZCBsb25nKSkK
KwlpZiAocmVnX251bSA+PSByZWdzX21heCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKKwlyZWdfbnVt
ID0gYXJyYXlfaW5kZXhfbm9zcGVjKHJlZ19udW0sIHJlZ3NfbWF4KTsKKwogCSgodW5zaWduZWQg
bG9uZyAqKWNzcilbcmVnX251bV0gPSByZWdfdmFsOwogCXJldHVybiAwOwogfQpAQCAtNTYyLDEx
ICs1NzksMTQgQEAgc3RhdGljIGludCBrdm1fcmlzY3ZfdmNwdV9zbXN0YXRlZW5fZ2V0X2Nzcihz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJCSAgICB1bnNpZ25lZCBsb25nICpvdXRfdmFsKQog
ewogCXN0cnVjdCBrdm1fdmNwdV9zbXN0YXRlZW5fY3NyICpjc3IgPSAmdmNwdS0+YXJjaC5zbXN0
YXRlZW5fY3NyOworCXVuc2lnbmVkIGxvbmcgcmVnc19tYXggPSBzaXplb2Yoc3RydWN0IGt2bV9y
aXNjdl9zbXN0YXRlZW5fY3NyKSAvCisJCXNpemVvZih1bnNpZ25lZCBsb25nKTsKIAotCWlmIChy
ZWdfbnVtID49IHNpemVvZihzdHJ1Y3Qga3ZtX3Jpc2N2X3Ntc3RhdGVlbl9jc3IpIC8KLQkJc2l6
ZW9mKHVuc2lnbmVkIGxvbmcpKQorCWlmIChyZWdfbnVtID49IHJlZ3NfbWF4KQogCQlyZXR1cm4g
LUVJTlZBTDsKIAorCXJlZ19udW0gPSBhcnJheV9pbmRleF9ub3NwZWMocmVnX251bSwgcmVnc19t
YXgpOworCiAJKm91dF92YWwgPSAoKHVuc2lnbmVkIGxvbmcgKiljc3IpW3JlZ19udW1dOwogCXJl
dHVybiAwOwogfQoKLS0gCjIuNTEuMAoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
