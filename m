Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC570EC1451
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wp6TjND9MzLMgiSfZ1sYrBDB7cL/5gSVE6uzkiVbwTk=; b=Y7m7IPVczA73I4
	L9JEH7Ev4Oc8cwarOt6416yspOf3UlzVBlnv/qNAkxnpCaljj5wVVYO0WtGTAOdJtdPgcUxzxGNZ2
	Gt+8AZfhsEZ7W6FwWB6OD+OJnSpVgFZZU5FIYhuH5nC2yJ/oiMe5gnxR/UjF4zoAFFAm3CqkyAZRN
	wfHh1Y9TRVA4SG4bMdvXT5gwU2DaZT5L+s5RfNgDw4MZ+e5l2EvfwmI3ZsSp3QutOyFMaaTyiF2W0
	+iWNc3YWGA7VUNhq5gqNkN5NSc0hxjJ3C5T3ZEQK1y16AkuYGIuLi/FnOmWe1wkve0u1tzA8jVb1i
	hh+SYU7FLSfPTtOOIKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQbS-0000000FJFj-0ia9;
	Tue, 03 Mar 2026 14:20:02 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQbQ-0000000FJD5-0SBL;
	Tue, 03 Mar 2026 14:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=CC:To:In-Reply-To:References:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yVoHntqSoUsA+2/rgo1maXXswKzLzoa8w8hdNMp26VE=; b=BaKNGRcYaT/fUwvHRRF/o511AP
	CXi6cuSX62g5rl5agqvxu7/lqIETCxr71zT6Se1G9X3VPG/yQYvPyDxCZxhS6O/hr1osYZUR2FmyG
	RY+UMsvrNUZr3paUuP0eJlMTWrJwg0Y8e8cR/mocK7zhY4pZ/fFr2mHM4creha1cndcIIO1hr9sdt
	0p0mG2zCRqhm5HTf20vcvCrWsahNSPrsKBfacNDoV641YG2kusQ285HyHxu/XSRxnKGErU9ejHpJE
	qGR+FrvC22o8X0VYsKPcGvNGQc5/Ah6V03eWm+js9xl8uOBxqT3cR7lPcHrzamDWabxU7cVFZ29YQ
	ShBOErRw==;
Received: from mailer.gwdg.de ([134.76.10.26]:56797)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vxQb8-00850R-2P;
	Tue, 03 Mar 2026 15:19:43 +0100
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vxQb9-0006kV-1Z;
	Tue, 03 Mar 2026 15:19:43 +0100
Received: from lukass-mbp-7.lan (10.250.9.200) by MBX19-SUB-05.um.gwdg.de
 (10.108.142.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Tue, 3 Mar
 2026 15:19:42 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
Date: Tue, 3 Mar 2026 15:19:42 +0100
Subject: [PATCH v2 2/4] KVM: riscv: Fix Spectre-v1 in AIA CSR access
MIME-Version: 1.0
Message-ID: <20260303-kvm-riscv-spectre-v1-v2-2-192caab8e0dc@cispa.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077;
 i=lukas.gerlach@cispa.de; h=from:subject:message-id;
 bh=BlH7+hXy1ms4n8/da7TKhRnIXRsOiXYku1MgTJCyimE=;
 b=owGbwMvMwCGWoTIjqP/42kTG02pJDJnL3v69fFpB2FgmvejjhFmfOq/tboxouxV1K7+VO+ET8
 1bug1ePdZSyMIhxMMiKKbJMFXzN2LfHgScp8/A5mDmsTCBDGLg4BWAiv2UY/plJBJ5lrlRUyncQ
 ThJybn0+2dA4MTbASW666s52j+iJvYwM73aKfH4/+VHQxQc6B02SxRweznnXE2knFn6vM4e1ofA
 6PwA=
X-Developer-Key: i=lukas.gerlach@cispa.de; a=openpgp;
 fpr=9511EB018EBC400C6269C3CE682498528FC7AD61
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-SUB-05.um.gwdg.de (10.108.142.70) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_062000_152883_565D8705 
X-CRM114-Status: UNSURE (   8.94  )
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

VXNlci1jb250cm9sbGVkIGluZGljZXMgYXJlIHVzZWQgdG8gYWNjZXNzIEFJQSBDU1IgcmVnaXN0
ZXJzLgpTYW5pdGl6ZSB0aGVtIHdpdGggYXJyYXlfaW5kZXhfbm9zcGVjKCkgdG8gcHJldmVudCBz
cGVjdWxhdGl2ZQpvdXQtb2YtYm91bmRzIGFjY2Vzcy4KClNpbWlsYXIgdG8geDg2IGNvbW1pdCA4
Yzg2NDA1ZjYwNmMgKCJLVk06IHg4NjogUHJvdGVjdAppb2FwaWNfcmVhZF9pbmRpcmVjdCgpIGZy
b20gU3BlY3RyZS12MS9MMVRGIGF0dGFja3MiKSBhbmQgYXJtNjQKY29tbWl0IDQxYjg3NTk5Yzc0
MyAoIktWTTogYXJtL2FybTY0OiB2Z2ljOiBmaXggcG9zc2libGUgc3BlY3RyZS12MQppbiB2Z2lj
X2dldF9pcnEoKSIpLgoKUmV2aWV3ZWQtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0ua3JjbWFy
QG9zcy5xdWFsY29tbS5jb20+ClNpZ25lZC1vZmYtYnk6IEx1a2FzIEdlcmxhY2ggPGx1a2FzLmdl
cmxhY2hAY2lzcGEuZGU+Ci0tLQogYXJjaC9yaXNjdi9rdm0vYWlhLmMgfCAxMSArKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWEuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYS5jCmluZGV4
IGNhYzNjMmI1MWQ3Mi4uMzhkZTk3ZDJmNWI4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS9h
aWEuYworKysgYi9hcmNoL3Jpc2N2L2t2bS9haWEuYwpAQCAtMTMsNiArMTMsNyBAQAogI2luY2x1
ZGUgPGxpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaD4KICNpbmNsdWRlIDxsaW51eC9pcnFkb21h
aW4uaD4KICNpbmNsdWRlIDxsaW51eC9rdm1faG9zdC5oPgorI2luY2x1ZGUgPGxpbnV4L25vc3Bl
Yy5oPgogI2luY2x1ZGUgPGxpbnV4L3BlcmNwdS5oPgogI2luY2x1ZGUgPGxpbnV4L3NwaW5sb2Nr
Lmg+CiAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KQEAgLTE4MiwxMCArMTgzLDEzIEBAIGlu
dCBrdm1fcmlzY3ZfdmNwdV9haWFfZ2V0X2NzcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkg
ICAgICAgdW5zaWduZWQgbG9uZyAqb3V0X3ZhbCkKIHsKIAlzdHJ1Y3Qga3ZtX3ZjcHVfYWlhX2Nz
ciAqY3NyID0gJnZjcHUtPmFyY2guYWlhX2NvbnRleHQuZ3Vlc3RfY3NyOworCXVuc2lnbmVkIGxv
bmcgcmVnc19tYXggPSBzaXplb2Yoc3RydWN0IGt2bV9yaXNjdl9haWFfY3NyKSAvIHNpemVvZih1
bnNpZ25lZCBsb25nKTsKIAotCWlmIChyZWdfbnVtID49IHNpemVvZihzdHJ1Y3Qga3ZtX3Jpc2N2
X2FpYV9jc3IpIC8gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpKQorCWlmIChyZWdfbnVtID49IHJlZ3Nf
bWF4KQogCQlyZXR1cm4gLUVOT0VOVDsKIAorCXJlZ19udW0gPSBhcnJheV9pbmRleF9ub3NwZWMo
cmVnX251bSwgcmVnc19tYXgpOworCiAJKm91dF92YWwgPSAwOwogCWlmIChrdm1fcmlzY3ZfYWlh
X2F2YWlsYWJsZSgpKQogCQkqb3V0X3ZhbCA9ICgodW5zaWduZWQgbG9uZyAqKWNzcilbcmVnX251
bV07CkBAIC0xOTgsMTAgKzIwMiwxMyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWlhX3NldF9jc3Io
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgdmFsKQogewog
CXN0cnVjdCBrdm1fdmNwdV9haWFfY3NyICpjc3IgPSAmdmNwdS0+YXJjaC5haWFfY29udGV4dC5n
dWVzdF9jc3I7CisJdW5zaWduZWQgbG9uZyByZWdzX21heCA9IHNpemVvZihzdHJ1Y3Qga3ZtX3Jp
c2N2X2FpYV9jc3IpIC8gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpOwogCi0JaWYgKHJlZ19udW0gPj0g
c2l6ZW9mKHN0cnVjdCBrdm1fcmlzY3ZfYWlhX2NzcikgLyBzaXplb2YodW5zaWduZWQgbG9uZykp
CisJaWYgKHJlZ19udW0gPj0gcmVnc19tYXgpCiAJCXJldHVybiAtRU5PRU5UOwogCisJcmVnX251
bSA9IGFycmF5X2luZGV4X25vc3BlYyhyZWdfbnVtLCByZWdzX21heCk7CisKIAlpZiAoa3ZtX3Jp
c2N2X2FpYV9hdmFpbGFibGUoKSkgewogCQkoKHVuc2lnbmVkIGxvbmcgKiljc3IpW3JlZ19udW1d
ID0gdmFsOwogCgotLSAKMi41MS4wCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9rdm0tcmlzY3YK
