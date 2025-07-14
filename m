Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E0EC83F17
	for <kvm-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 07:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:Mime-Version:
	Subject:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H8IVrdqxk1N0FFpCdljxzwduRV3mxXp8txjuRolPbfM=; b=u3FdgIAGMb2zyA
	mFFjS9SewekCA0dMXr0qRwsb8G0+zBxR4zerId5ypGEk5h+sotq7bGuIggQbzzNMITNAD0VR1MfKR
	sPqYix/4xC62BOz+9zJNPTKQRZ2otP1S81ZB1rJSeEXFJGuR6+9kC5NMKo4CU6KTwMKWGZJXYhyaI
	b4+cQeXT/UUdNNglYISg9BT3bDTYVdNOkhCIZfUwGgrce0oGqhjQaZILxNbNYCAEOfdfA2WbcUnLO
	eHck6ZA4lZ4QgjBplj0eWQd6KipB2MT8Avsv8p7F7rOzdRWimqIxEeadkJG1nn6qP/99jpAdKJkpd
	Bgny07UMNLexysjkCisA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDvJ-00000001VxM-0RnQ;
	Mon, 14 Jul 2025 07:48:29 +0000
Received: from sg-1-36.ptr.blmpb.com ([118.26.132.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDVW-00000001SKp-0gXw
	for kvm-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 07:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1752477700;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=y271lZtuVJ/3OzGRBrxJUOZ72ijQbIdeHDFq98NdTcY=;
 b=TQbptem9p1NN+oU0ah1gVy0ynUC8I0w5xnA5fSTTHOMh18supbPsVMvc2VReRvlae278A1
 /I44kffO9A2y/1I7KNLhARnDXmS9OzCWkiq8LaoN4b/jUnJ4agIWdC0UMpUbhOxpqiuaVj
 KFMTIh+FqUA9gZJr8Fjb3HnjCu+WLKsLxe7+4oYIu5IMY79KwIW2TuDqPLgjS4Img2umPG
 gWK2YiyzFs62UoXAEduLwvux5rajcZkqNspwNxCvnPGW6Pg3/hgVHHqdaGCzsSXZrr/7gP
 vQiQxtRe8LcPkVTVIX4N+cULZ3uM6OzN3VJhVh3oZlgqD/Arpoqk0j3p6CyBdw==
Received: from localhost.localdomain ([222.128.9.250]) by smtp.feishu.cn with ESMTP; Mon, 14 Jul 2025 15:21:37 +0800
X-Mailer: git-send-email 2.46.2.windows.1
To: <anup@brainfault.org>
Cc: <atish.patra@linux.dev>, <paul.walmsley@sifive.com>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<xiangwencheng@lanxincomputing.com>
Subject: [PATCH] RISC-V: KVM: Introduce KVM_EXIT_FAIL_ENTRY_NO_VSFILE
Mime-Version: 1.0
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
Date: Mon, 14 Jul 2025 15:20:50 +0800
X-Lms-Return-Path: <lba+26874b002+50df06+lists.infradead.org+xiangwencheng@lanxincomputing.com>
Message-Id: <20250714072051.1928-1-xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_002150_375462_D55BF3C0 
X-CRM114-Status: UNSURE (   9.48  )
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

Q29uc2lkZXIgYSBzeXN0ZW0gd2l0aCA4IGhhcnRzLCB3aGVyZSBlYWNoIGhhcnQgc3VwcG9ydHMg
NQpHdWVzdCBJbnRlcnJ1cHQgRmlsZXMgKEdJRnMpLCB5aWVsZGluZyA0MCB0b3RhbCBHSUZzLgpJ
ZiB3ZSBsYXVuY2ggYSBRRU1VIGd1ZXN0IHdpdGggb3ZlciA1IHZDUFVzIHVzaW5nCiItTSB2aXJ0
LGFpYT0nYXBsaWMtaW1zaWMnIC1hY2NlbCBrdm0scmlzY3YtYWlhPWh3YWNjZWwiIOKAkyB3aGlj
aApyZWxpZXMgc29sZWx5IG9uIFZTLWZpbGVzIChub3QgU1ctZmlsZXMpIGZvciBoaWdoZXIgcGVy
Zm9ybWFuY2Ug4oCTIHRoZQpndWVzdCByZXF1aXJlcyBtb3JlIHRoYW4gNSBHSUZzLiBIb3dldmVy
LCB0aGUgY3VycmVudCBMaW51eCBzY2hlZHVsZXIKbGFja3MgR0lGIGF3YXJlbmVzcywgcG90ZW50
aWFsbHkgc2NoZWR1bGluZyA+NSB2Q1BVcyB0byBhIHNpbmdsZSBoYXJ0LgpUaGlzIHRyaWdnZXJz
IFZTLWZpbGUgYWxsb2NhdGlvbiBmYWlsdXJlLCBhbmQgc2luY2Ugbm8gaGFuZGxlciBleGlzdHMK
Zm9yIHRoaXMgZXJyb3IsIHRoZSBRRU1VIGd1ZXN0IGJlY29tZXMgY29ycnVwdGVkLgoKVG8gYWRk
cmVzcyB0aGlzLCB3ZSBpbnRyb2R1Y2UgS1ZNX0VYSVRfRkFJTF9FTlRSWV9OT19WU0ZJTEUgdXBv
bgpWUy1maWxlIGFsbG9jYXRpb24gZmFpbHVyZS4gVGhpcyBwcm92aWRlcyBhbiBvcHBvcnR1bml0
eSBmb3IgZ3JhY2VmdWwKZXJyb3IgaGFuZGxpbmcgaW5zdGVhZCBvZiBjb3JydXB0aW9uLiBGb3Ig
ZXhhbXBsZSwgUUVNVSBjYW4gaGFuZGxlCnRoaXMgZXhpdCBieSByZXNjaGVkdWxpbmcgdkNQVXMg
dG8gYWx0ZXJuYXRpdmUgaGFydHMgd2hlbiBWUy1maWxlCmFsbG9jYXRpb24gZmFpbHMgb24gdGhl
IGN1cnJlbnQgaGFydCBbMV0uCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL0JpbGxYaWFuZy9xZW11
L3RyZWUvcmlzY3YtdnNmaWxlLWFsbG9jLwoKU2lnbmVkLW9mZi1ieTogQmlsbFhpYW5nIDx4aWFu
Z3dlbmNoZW5nQGxhbnhpbmNvbXB1dGluZy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oIHwgMiArKwogYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgICAgICAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKaW5kZXggNWY1OWZkMjI2Y2M1Li5iZTI5YzM1MDJmZTQg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAorKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKQEAgLTIyLDYgKzIyLDggQEAKICNkZWZpbmUg
S1ZNX0lOVEVSUlVQVF9TRVQJLTFVCiAjZGVmaW5lIEtWTV9JTlRFUlJVUFRfVU5TRVQJLTJVCiAK
KyNkZWZpbmUgS1ZNX0VYSVRfRkFJTF9FTlRSWV9OT19WU0ZJTEUJKDFVTEwgPDwgMCkKKwogLyog
Zm9yIEtWTV9HRVRfUkVHUyBhbmQgS1ZNX1NFVF9SRUdTICovCiBzdHJ1Y3Qga3ZtX3JlZ3Mgewog
fTsKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9r
dm0vYWlhX2ltc2ljLmMKaW5kZXggMjllZjljMjEzM2E5Li42OWIwYWI2NTEzODkgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9p
bXNpYy5jCkBAIC03NjAsNyArNzYwLDcgQEAgaW50IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY191
cGRhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQkvKiBGb3IgSFcgYWNjZWxlcmF0aW9uIG1v
ZGUsIHdlIGNhbid0IGNvbnRpbnVlICovCiAJCWlmIChrdm0tPmFyY2guYWlhLm1vZGUgPT0gS1ZN
X0RFVl9SSVNDVl9BSUFfTU9ERV9IV0FDQ0VMKSB7CiAJCQlydW4tPmZhaWxfZW50cnkuaGFyZHdh
cmVfZW50cnlfZmFpbHVyZV9yZWFzb24gPQotCQkJCQkJCQlDU1JfSFNUQVRVUzsKKwkJCQkJCQkJ
S1ZNX0VYSVRfRkFJTF9FTlRSWV9OT19WU0ZJTEU7CiAJCQlydW4tPmZhaWxfZW50cnkuY3B1ID0g
dmNwdS0+Y3B1OwogCQkJcnVuLT5leGl0X3JlYXNvbiA9IEtWTV9FWElUX0ZBSUxfRU5UUlk7CiAJ
CQlyZXR1cm4gMDsKLS0gCjIuNDYuMi53aW5kb3dzLjEKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
