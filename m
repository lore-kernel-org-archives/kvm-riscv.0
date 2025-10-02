Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B33CAC5B8
	for <kvm-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 03:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eCxjKfIRkCm1sU+tu7X3FNTGqXWUVGXs7ZC79shLCrg=; b=AvSBn3JZS8UVqW
	HrgOhSjNEPYbibnBNXmVTyqkB/AdWt57E16zHX0AniXIXDW3Ya6/CD0zlur9U6EWW9MqXO77dZ0TY
	7cpYLOhmbOQ5E5PX3qphyRhI1noGFrtbpsgGQXj3mFCR+8zGxJ1hWuxTPhbwqjieOkp/PTHvCgEfk
	5tK0TQqNZux//QCGfyYEs2kX+54QNrtlm+aXg0twOhv65CJBDzjAmk4Z/XV3JPDF91a4fn094vSLv
	IXYORB+XDfY6qdH1vRH3JzhZy+y0FJPkX+BJWC5tckZqbWQ8J10seEk4G/WchXp5EW2dcORj4WuYR
	0hXxCAb05F2YPoTnHyUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4A8s-00000009Xqs-1tJw;
	Thu, 02 Oct 2025 03:38:06 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4A8o-00000009XnM-2WbW;
	Thu, 02 Oct 2025 03:38:05 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5923YIBN012646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Oct 2025 11:34:18 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Thu, 2 Oct 2025
 11:34:18 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <liujingqi@lanxincomputing.com>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        Hui Min Mina Chou
	<minachou@andestech.com>,
        Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH] RISC-V: KVM: flush VS-stage TLB after VCPU migration to prevent stale entries
Date: Thu, 2 Oct 2025 11:34:02 +0800
Message-ID: <20251002033402.610651-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5923YIBN012646
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_203802_958713_3A178F40 
X-CRM114-Status: UNSURE (   7.61  )
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
IG1pZ3JhdGlvbi4KCkZpeGVzOiBiNzliZjIwMjVkYmMgKCJSSVNDLVY6IEtWTTogUmVuYW1lIGFu
ZCBtb3ZlIGt2bV9yaXNjdl9sb2NhbF90bGJfc2FuaXRpemUoKSIpClNpZ25lZC1vZmYtYnk6IEh1
aSBNaW4gTWluYSBDaG91IDxtaW5hY2hvdUBhbmRlc3RlY2guY29tPgpTaWduZWQtb2ZmLWJ5OiBC
ZW4gWm9uZy1Zb3UgWGllIDxiZW43MTdAYW5kZXN0ZWNoLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2t2
bS92bWlkLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYwpp
bmRleCAzYjQyNmM4MDA0ODAuLjM4YzZmNTMyYTZmOCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9r
dm0vdm1pZC5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYwpAQCAtMTQ2LDQgKzE0NiwxMCBA
QCB2b2lkIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF9zYW5pdGl6ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUpCiAKIAl2bWlkID0gUkVBRF9PTkNFKHZjcHUtPmt2bS0+YXJjaC52bWlkLnZtaWQpOwogCWt2
bV9yaXNjdl9sb2NhbF9oZmVuY2VfZ3ZtYV92bWlkX2FsbCh2bWlkKTsKKworCS8qCisJICogRmx1
c2ggVlMtc3RhZ2UgVExCcyBlbnRyeSBhZnRlciBWQ1BVIG1pZ3JhdGlvbiB0byBhdm9pZCB1c2lu
ZworCSAqIHN0YWxlIGVudHJpZXMuCisJICovCisJa3ZtX3Jpc2N2X2xvY2FsX2hmZW5jZV92dm1h
X2FsbCh2bWlkKTsKIH0KLS0gCjIuMzQuMQoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
