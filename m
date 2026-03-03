Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328A1EC144C
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 14:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sKpIMBfmlHDxKeWPFHH6pqAC7Db3W9f7A3M2ZBM44Os=; b=TDo7tniqt128ii
	IpY4QF186MJwfy5WG3y2kZ7aOZHNooLNpr4Zfk/v3to+I8CNtMGm+xSi0kPiXSo5ZlhP6NP7/d/5z
	nQtBHJBlAuDylFRgZlDW6WG15AOiwRc31xBvkKAU1DM9MVabgYcQ02InsAbYJb6z9NjuactBaRliU
	pFRCl8iSc3g7gDCjBSkgH5v8xAYXe3S4v8FQtsm6m7zzRELq2I1z/9j9UlzeXvsXRhAY3/Xwtut5b
	8SkUrI29DKX7bZgCHZAAj5fMA+RWNbSeokMF3nOkpyFcaHQ3/vLUKSxsjtEmW9G74hEjLqCM9uQQd
	C86SwDMrSpUvfigy/gJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQbW-0000000FJJO-3t59;
	Tue, 03 Mar 2026 14:20:06 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQbS-0000000FJD4-0Fvg;
	Tue, 03 Mar 2026 14:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=CC:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Yk82U+KWKNBJrJErXLIwO/U/S9eC+6zTWy0oWkG4+U4=; b=G/X50Yg2QttbkXpWRAy/Gurn9r
	zl2DC3ZgCG84DKKNEuZ19k3oRwrGlsArhHbu4Laryc1uyzYxxWRIiU+1o3Cl8u3RH4Js29eRaIpBB
	Wh8q1BkMO5pzgJ6etzc9cikEMrSTmN8FRlHzee3WrH1qe7pNIIolJIvbH6q1TxuyscnTgVRlKRc+3
	//27EvAWVYhMhTbou86owUHkCGc/kmgJVaEv2l8IerNOHfcYIF+C4z4sY+Le5S1PCsWS5WkzI5YgU
	OT9KEli6uXJCHmwFng7T9QkEtZb5EZ8npaBy016/XoHpXTHID7xlBfFEbmaILESsAkC4wljdZD3p1
	eAKZdU1Q==;
Received: from mailer.gwdg.de ([134.76.10.26]:42647)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vxQb7-00850E-2q;
	Tue, 03 Mar 2026 15:19:42 +0100
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vxQb8-0006k0-25;
	Tue, 03 Mar 2026 15:19:42 +0100
Received: from lukass-mbp-7.lan (10.250.9.200) by MBX19-SUB-05.um.gwdg.de
 (10.108.142.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Tue, 3 Mar
 2026 15:19:42 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
Subject: [PATCH v2 0/4] KVM: riscv: Fix Spectre-v1 vulnerabilities in
 register access
Date: Tue, 3 Mar 2026 15:19:40 +0100
Message-ID: <20260303-kvm-riscv-spectre-v1-v2-0-192caab8e0dc@cispa.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQrCMBCFr1Jm7UgSa7CuvId0EZKpHcS2zJSgl
 Nzd2AsIb/M93s8GSsKkcG02EMqsPE8V3KGBOIbpQcipMjjjvHHO4zO/UFhjRl0orkKYLbbJtCn
 6S6wJqNVFaOD3PnvvK4+s6yyf/SXbn/tnsMrgeehOhoL1vrO3yLqEYyLoSylfvYoXFbcAAAA=
X-Change-ID: 20260226-kvm-riscv-spectre-v1-4d04dc68c226
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070;
 i=lukas.gerlach@cispa.de; h=from:subject:message-id;
 bh=TvGiCrPJ5gB7ACBx6XkfQjs2TuYKmp071Y3ILmNLpS0=;
 b=owGbwMvMwCGWoTIjqP/42kTG02pJDJnL3v6V+iDzwOlfkeXPiGve/rvOGf4ujki/cPWizUJF3
 RvzJqVM6ChlYRDjYJAVU2SZKviasW+PA09S5uFzMHNYmUCGMHBxCsBERJkZ/mfvPhJgcfZpQDXX
 z03fE08Zrq/aV3g0xHP6yiVf22U+2Exg+O/B2mQ6demek9s6es1YL9jP/dJqdboxTOi4x5GzD5S
 XTeIFAA==
X-Developer-Key: i=lukas.gerlach@cispa.de; a=openpgp;
 fpr=9511EB018EBC400C6269C3CE682498528FC7AD61
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-SUB-05.um.gwdg.de (10.108.142.70) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_062002_101965_DAB8529D 
X-CRM114-Status: UNSURE (   4.38  )
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

VGhpcyBzZXJpZXMgYWRkcyBhcnJheV9pbmRleF9ub3NwZWMoKSB0byBSSVNDLVYgS1ZNIHRvIHBy
ZXZlbnQKc3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5kcyBhY2Nlc3MgdG8ga2VybmVsIG1lbW9yeS4K
ClNpbWlsYXIgZml4ZXMgZXhpc3QgZm9yIHg4NiAoaW9hcGljLCBsYXBpYywgUE1VKSBhbmQgYXJt
NjQgKHZnaWMpLgoKU2lnbmVkLW9mZi1ieTogTHVrYXMgR2VybGFjaCA8bHVrYXMuZ2VybGFjaEBj
aXNwYS5kZT4KLS0tCkNoYW5nZXMgaW4gdjI6CkFkZCBhcnJheV9pbmRleF9ub3NwZWMoKSB0byBm
b3VyIGFkZGl0aW9uYWwgc2l0ZXMgaW4gdmNwdV9wbXUuYwooUmFkaW0gS3LEjW3DocWZKQoKLS0t
Ckx1a2FzIEdlcmxhY2ggKDQpOgogICAgICBLVk06IHJpc2N2OiBGaXggU3BlY3RyZS12MSBpbiBP
TkVfUkVHIHJlZ2lzdGVyIGFjY2VzcwogICAgICBLVk06IHJpc2N2OiBGaXggU3BlY3RyZS12MSBp
biBBSUEgQ1NSIGFjY2VzcwogICAgICBLVk06IHJpc2N2OiBGaXggU3BlY3RyZS12MSBpbiBmbG9h
dGluZy1wb2ludCByZWdpc3RlciBhY2Nlc3MKICAgICAgS1ZNOiByaXNjdjogRml4IFNwZWN0cmUt
djEgaW4gUE1VIGNvdW50ZXIgYWNjZXNzCgogYXJjaC9yaXNjdi9rdm0vYWlhLmMgICAgICAgICB8
IDExICsrKysrKysrKy0tCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X2ZwLmMgICAgIHwgMTcgKysrKysr
KysrKysrKy0tLS0KIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgfCAzNiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgICAg
fCAxNCArKysrKysrKysrKy0tLQogNCBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCAx
NyBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiBmNGQwZWMwYWEyMGQ0OWYwOWRjMDFkODI4
OTRjZTgwZDcyZGUwNTYwCmNoYW5nZS1pZDogMjAyNjAyMjYta3ZtLXJpc2N2LXNwZWN0cmUtdjEt
NGQwNGRjNjhjMjI2CgpCZXN0IHJlZ2FyZHMsCi0tIApMdWthcyBHZXJsYWNoIDxsdWthcy5nZXJs
YWNoQGNpc3BhLmRlPgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
