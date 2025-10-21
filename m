Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCC4CCD184
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 08:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3dv4IuQhaJnsyfhMxaLqChaTo0IckmTVwHcqrPZt8hs=; b=UxHNPGTj0HIkL7
	i4uNLj865ujzTF35Vs6pTvD/YZevuDJWFwh06zJ6kuO93/TQSLRLkRpHan3eB/OYuhV4vC2E4rFVB
	EtboHGuZVHGaLrvFXX42WtIOn3BpAkkuq2uQrwHIRACBBZSbKB6MEQAWKUXL5pHY9KrG1lHTvQ9jV
	1sAe1mmG5Z0Ndp/IbNLJvjNsYROxDFs+nXb9Dm+Nbvz1TKQ0EsSLrhHigfd6UQl6x6zpipiZ2FuIp
	S1xOSuJKdjBC9XYLmuHqHwv7XV+VQUH2mt1ydyWMCfHgUgxrmjWpZnb0Uv3Dyh8YJxEmoQaN2fiic
	B1bOp5M3Y3tQLOPZz/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7qJ-0000000GIQo-1Udl;
	Tue, 21 Oct 2025 08:35:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7qH-0000000GIOM-2toA;
	Tue, 21 Oct 2025 08:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EhWT3FZr1oyZw2HtggHUGEK2ElDviAV56v1w9+2VKxc=; b=TpBF9jJ3e5kaMLlGMjH+8MTLhi
	4dMhWk3VB2MHJGm14I4/LbzzuiTHJ267DsxBXIkAoIJ6F+fs0lwxGjSHdR1cBruOzCRgcVW/MS7V5
	CNQvNt3AcFnB5uygvNY9leGdJ6OMzw+DdgDY48QI2S4PH2igbXtcCWshj62xCJV3BhVEubkciyuov
	cMS2Xy9/F9bnSN57H2vH3m56Y3uLPnxHyHW8BcHLO/0CgsbawHDjsWIZV0IiZtNC2XeBohnjfZjyN
	H8M8OdYEDXkl6t+X4LSvRPnba08xypySbUcfGgIPTedNHUxcjPwCNFhmA2CxtBHxSR1Ildfxlbdik
	FhtTqUvA==;
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7pw-00000001V8r-1qpH;
	Tue, 21 Oct 2025 08:35:29 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 59L8VrpO071964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Tue, 21 Oct 2025 16:31:53 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Oct
 2025 16:31:53 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
CC: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <tim609@andestech.com>, <minachou@andestech.com>,
        <ben717@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2] RISC-V: KVM: flush VS-stage TLB after VCPU migration to prevent stale entries
Date: Tue, 21 Oct 2025 16:31:05 +0800
Message-ID: <20251021083105.4029305-1-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 59L8VrpO071964
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_093522_349725_363BA8D7 
X-CRM114-Status: UNSURE (   7.94  )
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

RnJvbTogSHVpIE1pbiBNaW5hIENob3UgPG1pbmFjaG91QGFuZGVzdGVjaC5jb20+CgpJZiBtdWx0
aXBsZSBWQ1BVcyBvZiB0aGUgc2FtZSBHdWVzdC9WTSBydW4gb24gdGhlIHNhbWUgSG9zdCBDUFUs
CmhmZW5jZS52dm1hIG9ubHkgZmx1c2hlcyB0aGF0IEhvc3QgQ1BV4oCZcyBWUy1zdGFnZSBUTEIu
IE90aGVyIEhvc3QgQ1BVcwptYXkgcmV0YWluIHN0YWxlIFZTLXN0YWdlIGVudHJpZXMuIFdoZW4g
YSBWQ1BVIGxhdGVyIG1pZ3JhdGVzIHRvIGEKZGlmZmVyZW50IEhvc3QgQ1BVLCBpdCBjYW4gaGl0
IHRoZXNlIHN0YWxlIEdWQSB0byBHUEEgbWFwcGluZ3MsIGNhdXNpbmcKdW5leHBlY3RlZCBmYXVs
dHMgaW4gdGhlIEd1ZXN0LgoKVG8gZml4IHRoaXMsIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF9zYW5p
dGl6ZSgpIGlzIGV4dGVuZGVkIHRvIGZsdXNoIGJvdGgKRy1zdGFnZSBhbmQgVlMtc3RhZ2UgVExC
cyB3aGVuZXZlciBhIFZDUFUgbWlncmF0ZXMgdG8gYSBkaWZmZXJlbnQgSG9zdCBDUFUuClRoaXMg
ZW5zdXJlcyB0aGF0IG5vIHN0YWxlIFZTLXN0YWdlIG1hcHBpbmdzIHJlbWFpbiBhZnRlciBWQ1BV
IG1pZ3JhdGlvbi4KCkZpeGVzOiA5MmU0NTA1MDdkNTYgKCJSSVNDLVY6IEtWTTogQ2xlYW51cCBz
dGFsZSBUTEIgZW50cmllcyB3aGVuIGhvc3QgQ1BVIGNoYW5nZXMiKQpTaWduZWQtb2ZmLWJ5OiBI
dWkgTWluIE1pbmEgQ2hvdSA8bWluYWNob3VAYW5kZXN0ZWNoLmNvbT4KU2lnbmVkLW9mZi1ieTog
QmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+Ci0tLQpDaGFuZ2VzIGluIHYy
OgotIFVwZGF0ZWQgRml4ZXMgY29tbWl0IHRvIDkyZTQ1MDUwN2Q1NgotIFJlbmFtZWQgZnVuY3Rp
b24gdG8ga3ZtX3Jpc2N2X2xvY2FsX3RsYl9zYW5pdGl6ZQoKIGFyY2gvcmlzY3Yva3ZtL3ZtaWQu
YyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92bWlkLmMgYi9hcmNoL3Jpc2N2L2t2
bS92bWlkLmMKaW5kZXggM2I0MjZjODAwNDgwLi42MzIzZjUzODNkMzYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZtaWQuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92bWlkLmMKQEAgLTEyNSw3
ICsxMjUsNyBAQCB2b2lkIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF91cGRhdGUoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KQogCQlrdm1fbWFrZV9yZXF1ZXN0KEtWTV9SRVFfVVBEQVRFX0hHQVRQLCB2KTsK
IH0KIAotdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3ZtaWRfc2FuaXRpemUoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQordm9pZCBrdm1fcmlzY3ZfbG9jYWxfdGxiX3Nhbml0aXplKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKIHsKIAl1bnNpZ25lZCBsb25nIHZtaWQ7CiAKQEAgLTE0Niw0ICsxNDYsMTAgQEAg
dm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3ZtaWRfc2FuaXRpemUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQogCiAJdm1pZCA9IFJFQURfT05DRSh2Y3B1LT5rdm0tPmFyY2gudm1pZC52bWlkKTsKIAlrdm1f
cmlzY3ZfbG9jYWxfaGZlbmNlX2d2bWFfdm1pZF9hbGwodm1pZCk7CisKKwkvKgorCSAqIEZsdXNo
IFZTLXN0YWdlIFRMQnMgZW50cnkgYWZ0ZXIgVkNQVSBtaWdyYXRpb24gdG8gYXZvaWQgdXNpbmcK
KwkgKiBzdGFsZSBlbnRyaWVzLgorCSAqLworCWt2bV9yaXNjdl9sb2NhbF9oZmVuY2VfdnZtYV9h
bGwodm1pZCk7CiB9Ci0tIAoyLjM0LjEKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
