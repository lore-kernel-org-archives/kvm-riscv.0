Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6ABCCD1AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 03:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4Mi8Adbs3nU1x0RF4yLmDEdolNisRQWEA7x8603p458=; b=dJfw6HZcMZqP6H
	TAgnxTXoR78ZGP+tYS+MIcFSybombuENUSkQY66BCgz7fCPLXpx6vYCNgrV5ML0FhNS/gPL0d7bcp
	2JrRiT05injYrHQrq+3f/5Lln5pxwbMXy2DNXHYDMFwE1see5/JPU6GvpTfvzv+GyJ5AV99xk5qAU
	DoDKJpLBuIpYIG08JPtmbJP5XgwuHiVfN3AI0bS4rfyue05CLib+qqABt6LBvZS8YaC/IpWEp+ZPH
	OacezZY26mslrdoBhYzwUpUztmlD/iNMuMTI2ROjojwDcLWJ81UhZNXafhTOltzSEPNAS5OqMXfd0
	QNlc2ZPp9eGjMmr8meBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBm0f-00000004vXK-0YWV;
	Thu, 23 Oct 2025 03:29:05 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBm0X-00000004vTl-3p3x;
	Thu, 23 Oct 2025 03:29:03 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 59N3Q4Bw097416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 23 Oct 2025 11:26:04 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 23 Oct
 2025 11:26:04 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
CC: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <tim609@andestech.com>, <minachou@andestech.com>,
        <ben717@andestech.com>, <az70021@gmail.com>,
        =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?=
	<rkrcmar@ventanamicro.com>
Subject: [PATCH v3] RISC-V: KVM: flush VS-stage TLB after VCPU migration to prevent stale entries
Date: Thu, 23 Oct 2025 11:25:17 +0800
Message-ID: <20251023032517.2527193-1-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 59N3Q4Bw097416
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_202858_303775_7C8A5BC2 
X-CRM114-Status: UNSURE (   8.74  )
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
QmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+ClJldmlld2VkLWJ5OiBSYWRp
bSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KLS0tCnYzOgotIFJlc29sdmVk
IGJ1aWxkIHdhcm5pbmc7IHVwZGF0ZWQgaGVhZGVyIGRlY2xhcmF0aW9uIGFuZCBjYWxsIHNpZGUg
dG8KICBrdm1fcmlzY3ZfbG9jYWxfdGxiX3Nhbml0aXplCgp2MjoKLSBVcGRhdGVkIEZpeGVzIGNv
bW1pdCB0byA5MmU0NTA1MDdkNTYKLSBSZW5hbWVkIGZ1bmN0aW9uIHRvIGt2bV9yaXNjdl9sb2Nh
bF90bGJfc2FuaXRpemUKCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92bWlkLmggfCAyICst
CiBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgfCAyICstCiBhcmNoL3Jpc2N2L2t2
bS92bWlkLmMgICAgICAgICAgICAgfCA4ICsrKysrKystCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV92bWlkLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92bWlkLmgKaW5k
ZXggYWI5OGUxNDM0ZmI3Li43NWZiNmU4NzJjY2QgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20va3ZtX3ZtaWQuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92bWlk
LmgKQEAgLTIyLDYgKzIyLDYgQEAgdW5zaWduZWQgbG9uZyBrdm1fcmlzY3ZfZ3N0YWdlX3ZtaWRf
Yml0cyh2b2lkKTsKIGludCBrdm1fcmlzY3ZfZ3N0YWdlX3ZtaWRfaW5pdChzdHJ1Y3Qga3ZtICpr
dm0pOwogYm9vbCBrdm1fcmlzY3ZfZ3N0YWdlX3ZtaWRfdmVyX2NoYW5nZWQoc3RydWN0IGt2bV92
bWlkICp2bWlkKTsKIHZvaWQga3ZtX3Jpc2N2X2dzdGFnZV92bWlkX3VwZGF0ZShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpOwotdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3ZtaWRfc2FuaXRpemUoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KTsKK3ZvaWQga3ZtX3Jpc2N2X2xvY2FsX3RsYl9zYW5pdGl6ZShzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwppbmRleCAzZWJjZmZmYWE5NzguLjc5NjIx
OGU0YTQ2MiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCisrKyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYwpAQCAtOTY4LDcgKzk2OCw3IEBAIGludCBrdm1fYXJjaF92Y3B1X2lvY3Rs
X3J1bihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJCSAqIE5vdGU6IFRoaXMgc2hvdWxkIGJlIGRv
bmUgYWZ0ZXIgRy1zdGFnZSBWTUlEIGhhcyBiZWVuCiAJCSAqIHVwZGF0ZWQgdXNpbmcga3ZtX3Jp
c2N2X2dzdGFnZV92bWlkX3Zlcl9jaGFuZ2VkKCkKIAkJICovCi0JCWt2bV9yaXNjdl9nc3RhZ2Vf
dm1pZF9zYW5pdGl6ZSh2Y3B1KTsKKwkJa3ZtX3Jpc2N2X2xvY2FsX3RsYl9zYW5pdGl6ZSh2Y3B1
KTsKIAogCQl0cmFjZV9rdm1fZW50cnkodmNwdSk7CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL3ZtaWQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYwppbmRleCAzYjQyNmM4MDA0ODAuLjYz
MjNmNTM4M2QzNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdm1pZC5jCisrKyBiL2FyY2gv
cmlzY3Yva3ZtL3ZtaWQuYwpAQCAtMTI1LDcgKzEyNSw3IEBAIHZvaWQga3ZtX3Jpc2N2X2dzdGFn
ZV92bWlkX3VwZGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJCWt2bV9tYWtlX3JlcXVlc3Qo
S1ZNX1JFUV9VUERBVEVfSEdBVFAsIHYpOwogfQogCi12b2lkIGt2bV9yaXNjdl9nc3RhZ2Vfdm1p
ZF9zYW5pdGl6ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit2b2lkIGt2bV9yaXNjdl9sb2NhbF90
bGJfc2FuaXRpemUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogewogCXVuc2lnbmVkIGxvbmcgdm1p
ZDsKIApAQCAtMTQ2LDQgKzE0NiwxMCBAQCB2b2lkIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF9zYW5p
dGl6ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAKIAl2bWlkID0gUkVBRF9PTkNFKHZjcHUtPmt2
bS0+YXJjaC52bWlkLnZtaWQpOwogCWt2bV9yaXNjdl9sb2NhbF9oZmVuY2VfZ3ZtYV92bWlkX2Fs
bCh2bWlkKTsKKworCS8qCisJICogRmx1c2ggVlMtc3RhZ2UgVExCcyBlbnRyeSBhZnRlciBWQ1BV
IG1pZ3JhdGlvbiB0byBhdm9pZCB1c2luZworCSAqIHN0YWxlIGVudHJpZXMuCisJICovCisJa3Zt
X3Jpc2N2X2xvY2FsX2hmZW5jZV92dm1hX2FsbCh2bWlkKTsKIH0KLS0gCjIuMzQuMQoKCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
