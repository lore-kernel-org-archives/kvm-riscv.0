Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0008EC1451
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 14:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FXiSrblvFHpc/uYsd1DGCM/iCUjdg0vOXDPFey7f4KM=; b=xLlFwpbERqOL/k
	JcOLt2lB9wg7j6jNX50aZRFY+2ApOTTTodbjZofoS8axIM5YcZ2S7npDbf132M4q0CfEvqIRu0TC5
	lRMnhCP5HVzj3CaaoRmL9CFKJ3auINnIoj94b+GeVNTViwlxHRX5a4KzAAq97aXmH8MwL3hZd1EPp
	iI4REEuLGSt/Nf1IfHHTvtuCwZzi3aRbalC99bPGtz9CuyS4QfW2GAp8UBUnq/ADUfc0DdYidz3Z5
	L3wYY8f0KlusrJhl6E8CdzmqoZ1SBMsfK+5JnMjc+EvD78ro85kkAN1ntO0BVtoBczJ6dg8H88RSZ
	iSPbeMZ+BUJgg05aFl3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQbW-0000000FJIo-1YIm;
	Tue, 03 Mar 2026 14:20:06 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQbS-0000000FJD2-1Feh;
	Tue, 03 Mar 2026 14:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=CC:To:In-Reply-To:References:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=evQ738m5JttBj+gPIuFYJobVsWsJ7zXSUvfhaD0owBA=; b=RnSE4LFcCzWkOaKFYLcMgodKeL
	Ny0/rCrW5yuTNCZmfkPlfhGNn6O3Oq53za1rYD+fyUXyFVgGcg7LjObOmkBZwXfQJI5bMTGKJG+IL
	mUjZ/kJdFu19rdoPI0RJZApaeuGy0bMX6mJUV2LJaJuPl02DPqI6uf44WHU1yMwFp7jYL7wfeDqFc
	mX3TX+1QS99jcpPjpNXDymDNzazISQ9Ap1iM51O8H40YOwTadTRIHRiCfGU0WUswqi2zn4eEXlJXK
	wx1eALBvdrwpwoCENCoj5jPKtzT83fXTm4EP1drUOxrZRjm+6ItM+5oXuO6rLAux9mrf63tjXhWj0
	Xsy/BeBA==;
Received: from mailer.gwdg.de ([134.76.10.26]:33561)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vxQb9-00850W-0W;
	Tue, 03 Mar 2026 15:19:43 +0100
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vxQb9-0006kf-2q;
	Tue, 03 Mar 2026 15:19:43 +0100
Received: from lukass-mbp-7.lan (10.250.9.200) by MBX19-SUB-05.um.gwdg.de
 (10.108.142.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Tue, 3 Mar
 2026 15:19:43 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
Date: Tue, 3 Mar 2026 15:19:43 +0100
Subject: [PATCH v2 3/4] KVM: riscv: Fix Spectre-v1 in floating-point
 register access
MIME-Version: 1.0
Message-ID: <20260303-kvm-riscv-spectre-v1-v2-3-192caab8e0dc@cispa.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2605;
 i=lukas.gerlach@cispa.de; h=from:subject:message-id;
 bh=R92BAr2kqx5spiyvOG2j2jtmK0XMGCxxNze/Hhxk7C0=;
 b=owGbwMvMwCGWoTIjqP/42kTG02pJDJnL3v71qeE88bRvtcBki9R24ekFUhNfzZf4L3vS+7Zs2
 v6AJZdud5SyMIhxMMiKKbJMFXzN2LfHgScp8/A5mDmsTCBDGLg4BWAibCcY/or0qoSYX/jy3HHH
 Rb0gc+aNj6RdD3z0WJI17dwvo7I/J14z/NNg+bFIXtg6PfBLxKKXH7zmfVz98tG6misylzYXPpQ
 7tocDAA==
X-Developer-Key: i=lukas.gerlach@cispa.de; a=openpgp;
 fpr=9511EB018EBC400C6269C3CE682498528FC7AD61
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-SUB-05.um.gwdg.de (10.108.142.70) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_062002_346240_A34F0208 
X-CRM114-Status: UNSURE (   8.33  )
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

VXNlci1jb250cm9sbGVkIGluZGljZXMgYXJlIHVzZWQgdG8gaW5kZXggaW50byBmbG9hdGluZy1w
b2ludCByZWdpc3RlcnMuClNhbml0aXplIHRoZW0gd2l0aCBhcnJheV9pbmRleF9ub3NwZWMoKSB0
byBwcmV2ZW50IHNwZWN1bGF0aXZlCm91dC1vZi1ib3VuZHMgYWNjZXNzLgoKUmV2aWV3ZWQtYnk6
IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5xdWFsY29tbS5jb20+ClNpZ25lZC1v
ZmYtYnk6IEx1a2FzIEdlcmxhY2ggPGx1a2FzLmdlcmxhY2hAY2lzcGEuZGU+Ci0tLQogYXJjaC9y
aXNjdi9rdm0vdmNwdV9mcC5jIHwgMTcgKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfZnAuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZnAuYwppbmRleCAwMzA5MDRk
ODJiNTguLmJkNWE5ZTdlNzE2NSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9mcC5j
CisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZnAuYwpAQCAtMTAsNiArMTAsNyBAQAogI2luY2x1
ZGUgPGxpbnV4L2Vycm5vLmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+CiAjaW5jbHVkZSA8bGlu
dXgva3ZtX2hvc3QuaD4KKyNpbmNsdWRlIDxsaW51eC9ub3NwZWMuaD4KICNpbmNsdWRlIDxsaW51
eC91YWNjZXNzLmg+CiAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KIApAQCAtOTMsOSArOTQs
MTEgQEAgaW50IGt2bV9yaXNjdl92Y3B1X2dldF9yZWdfZnAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LAogCQlpZiAocmVnX251bSA9PSBLVk1fUkVHX1JJU0NWX0ZQX0ZfUkVHKGZjc3IpKQogCQkJcmVn
X3ZhbCA9ICZjbnR4LT5mcC5mLmZjc3I7CiAJCWVsc2UgaWYgKChLVk1fUkVHX1JJU0NWX0ZQX0Zf
UkVHKGZbMF0pIDw9IHJlZ19udW0pICYmCi0JCQkgIHJlZ19udW0gPD0gS1ZNX1JFR19SSVNDVl9G
UF9GX1JFRyhmWzMxXSkpCisJCQkgIHJlZ19udW0gPD0gS1ZNX1JFR19SSVNDVl9GUF9GX1JFRyhm
WzMxXSkpIHsKKwkJCXJlZ19udW0gPSBhcnJheV9pbmRleF9ub3NwZWMocmVnX251bSwKKwkJCQkJ
QVJSQVlfU0laRShjbnR4LT5mcC5mLmYpKTsKIAkJCXJlZ192YWwgPSAmY250eC0+ZnAuZi5mW3Jl
Z19udW1dOwotCQllbHNlCisJCX0gZWxzZQogCQkJcmV0dXJuIC1FTk9FTlQ7CiAJfSBlbHNlIGlm
ICgocnR5cGUgPT0gS1ZNX1JFR19SSVNDVl9GUF9EKSAmJgogCQkgICByaXNjdl9pc2FfZXh0ZW5z
aW9uX2F2YWlsYWJsZSh2Y3B1LT5hcmNoLmlzYSwgZCkpIHsKQEAgLTEwNyw2ICsxMTAsOCBAQCBp
bnQga3ZtX3Jpc2N2X3ZjcHVfZ2V0X3JlZ19mcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkg
ICByZWdfbnVtIDw9IEtWTV9SRUdfUklTQ1ZfRlBfRF9SRUcoZlszMV0pKSB7CiAJCQlpZiAoS1ZN
X1JFR19TSVpFKHJlZy0+aWQpICE9IHNpemVvZih1NjQpKQogCQkJCXJldHVybiAtRUlOVkFMOwor
CQkJcmVnX251bSA9IGFycmF5X2luZGV4X25vc3BlYyhyZWdfbnVtLAorCQkJCQlBUlJBWV9TSVpF
KGNudHgtPmZwLmQuZikpOwogCQkJcmVnX3ZhbCA9ICZjbnR4LT5mcC5kLmZbcmVnX251bV07CiAJ
CX0gZWxzZQogCQkJcmV0dXJuIC1FTk9FTlQ7CkBAIC0xMzgsOSArMTQzLDExIEBAIGludCBrdm1f
cmlzY3ZfdmNwdV9zZXRfcmVnX2ZwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkJaWYgKHJlZ19u
dW0gPT0gS1ZNX1JFR19SSVNDVl9GUF9GX1JFRyhmY3NyKSkKIAkJCXJlZ192YWwgPSAmY250eC0+
ZnAuZi5mY3NyOwogCQllbHNlIGlmICgoS1ZNX1JFR19SSVNDVl9GUF9GX1JFRyhmWzBdKSA8PSBy
ZWdfbnVtKSAmJgotCQkJICByZWdfbnVtIDw9IEtWTV9SRUdfUklTQ1ZfRlBfRl9SRUcoZlszMV0p
KQorCQkJICByZWdfbnVtIDw9IEtWTV9SRUdfUklTQ1ZfRlBfRl9SRUcoZlszMV0pKSB7CisJCQly
ZWdfbnVtID0gYXJyYXlfaW5kZXhfbm9zcGVjKHJlZ19udW0sCisJCQkJCUFSUkFZX1NJWkUoY250
eC0+ZnAuZi5mKSk7CiAJCQlyZWdfdmFsID0gJmNudHgtPmZwLmYuZltyZWdfbnVtXTsKLQkJZWxz
ZQorCQl9IGVsc2UKIAkJCXJldHVybiAtRU5PRU5UOwogCX0gZWxzZSBpZiAoKHJ0eXBlID09IEtW
TV9SRUdfUklTQ1ZfRlBfRCkgJiYKIAkJICAgcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUo
dmNwdS0+YXJjaC5pc2EsIGQpKSB7CkBAIC0xNTIsNiArMTU5LDggQEAgaW50IGt2bV9yaXNjdl92
Y3B1X3NldF9yZWdfZnAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJICAgcmVnX251bSA8PSBL
Vk1fUkVHX1JJU0NWX0ZQX0RfUkVHKGZbMzFdKSkgewogCQkJaWYgKEtWTV9SRUdfU0laRShyZWct
PmlkKSAhPSBzaXplb2YodTY0KSkKIAkJCQlyZXR1cm4gLUVJTlZBTDsKKwkJCXJlZ19udW0gPSBh
cnJheV9pbmRleF9ub3NwZWMocmVnX251bSwKKwkJCQkJQVJSQVlfU0laRShjbnR4LT5mcC5kLmYp
KTsKIAkJCXJlZ192YWwgPSAmY250eC0+ZnAuZC5mW3JlZ19udW1dOwogCQl9IGVsc2UKIAkJCXJl
dHVybiAtRU5PRU5UOwoKLS0gCjIuNTEuMAoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
