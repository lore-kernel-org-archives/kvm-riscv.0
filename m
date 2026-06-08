Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65098CD8CB9
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDVLal4M7ZJ2JOdxsuHOFLFKgDJAgJitVdA9KmIf/sA=; b=oXDBchKO9wP/SS
	R3wMPbU4TnNpwHQnJD57W1Ap63xmcnsITWTFB8t2V5XtrgMBfRys/5Ex4cHq143fBtFKFmqhftkuO
	phlOEPHXNZGCpOgu8QR/5URpozXGtceBB6L6P+t1tqxqLTEV4QWtafFQvzqQyc2DB3++i44tR7Oa7
	CVX63e7wVJJWVRki+YsUfAGgi+DWZ2myUfSxBnCGq/vuaiW2NGx0p+XMb8GrkS+DRNaBJoHkCCuMg
	xMUWgrJC9IqLStKAYyfzwb4kcj4rm0KLB1QPYuMvyUGn+uBLcsai6QfxurQsApGD1gdwfqbsoYqMP
	reRm0dji8kH6DkgKvXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCA-00000003pff-3otQ;
	Mon, 08 Jun 2026 14:43:18 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC4-00000003pTb-3ym1
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:16 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 579A02028AE;
	Mon,  8 Jun 2026 16:43:07 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com,
	Melody Wang <huibo.wang@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	x86@kernel.org,
	coconut-svsm@lists.linux.dev,
	joerg.roedel@amd.com,
	=?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
Subject: [PATCH 11/60] kvm: Introduce struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:03 +0200
Message-ID: <20260608144252.351443-12-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074313_161528_78B8A6DD 
X-CRM114-Status: GOOD (  15.94  )
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

RnJvbTogSm9lcmcgUm9lZGVsIDxqb2VyZy5yb2VkZWxAYW1kLmNvbT4KCldoZW4gY3JlYXRpbmcg
b25lIFZDUFUgb2JqZWN0IHBlciBwbGFuZSB0aGVyZSBpcyBzdGlsbCBhIGxvdCBvZiBWQ1BVCnN0
YXRlIHdoaWNoIG5lZWRlcyB0byBiZSBzaGFyZWQgYWNyb3NzIGFsbCBwbGFuZXMuIENyZWF0ZSBz
dHJ1Y3QKa3ZtX3ZjcHVfY29tbW9uIGFzIGEgY29udGFpbmVyIGZvciB0aGlzIHNoYXJlZCBzdGF0
ZS4KCkNvLWRldmVsb3BlZC1ieTogQ2FybG9zIEzDs3BleiA8Y2xvcGV6QHN1c2UuZGU+ClNpZ25l
ZC1vZmYtYnk6IEpvZXJnIFJvZWRlbCA8am9lcmcucm9lZGVsQGFtZC5jb20+Ci0tLQogaW5jbHVk
ZS9saW51eC9rdm1faG9zdC5oIHwgMTAgKysrKysrKysrKwogdmlydC9rdm0va3ZtX21haW4uYyAg
ICAgIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiAyIGZpbGVzIGNo
YW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9rdm1faG9zdC5oIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCmluZGV4IDVh
NzJmNzNhMmYzMS4uYzRjNDkyMmRmOTY1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9o
b3N0LmgKKysrIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCkBAIC0zMjIsNiArMzIyLDEzIEBA
IHN0cnVjdCBrdm1fbW1pb19mcmFnbWVudCB7CiAJdW5zaWduZWQgaW50IGxlbjsKIH07CiAKK3N0
cnVjdCBrdm1fdmNwdV9jb21tb24geworCXN0cnVjdCBrdm0gKmt2bTsKKworCS8qIEN1cnJlbnRs
eSBhY3RpdmUgVkNQVSAqLworCXN0cnVjdCBrdm1fdmNwdSAqY3VycmVudF92Y3B1OworfTsKKwog
c3RydWN0IGt2bV92Y3B1IHsKIAlzdHJ1Y3Qga3ZtICprdm07CiAJc3RydWN0IGt2bV9wbGFuZSAq
cGxhbmU7CkBAIC00MDAsNiArNDA3LDkgQEAgc3RydWN0IGt2bV92Y3B1IHsKIAkgKi8KIAlzdHJ1
Y3Qga3ZtX21lbW9yeV9zbG90ICpsYXN0X3VzZWRfc2xvdDsKIAl1NjQgbGFzdF91c2VkX3Nsb3Rf
Z2VuOworCisJc3RydWN0IGt2bV92Y3B1X2NvbW1vbiAqY29tbW9uOworCXVuc2lnbmVkIHBsYW5l
X2xldmVsOwogfTsKIAogLyoKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0
L2t2bS9rdm1fbWFpbi5jCmluZGV4IDY2ODY0NWRkMzk0NS4uZmI4NDBkMDI5YzU2IDEwMDY0NAot
LS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5jCisrKyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKQEAgLTQz
OCw2ICs0MzgsMjAgQEAgdm9pZCAqa3ZtX21tdV9tZW1vcnlfY2FjaGVfYWxsb2Moc3RydWN0IGt2
bV9tbXVfbWVtb3J5X2NhY2hlICptYykKIH0KICNlbmRpZgogCitzdGF0aWMgaW50IGt2bV92Y3B1
X2luaXRfY29tbW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bSAqa3ZtKQorewor
CXN0cnVjdCBrdm1fdmNwdV9jb21tb24gKmNvbW1vbiA9IGt6YWxsb2Moc2l6ZW9mKCpjb21tb24p
LCBHRlBfS0VSTkVMX0FDQ09VTlQpOworCisJaWYgKGNvbW1vbiA9PSBOVUxMKQorCQlyZXR1cm4g
LUVOT01FTTsKKworCWNvbW1vbi0+a3ZtID0ga3ZtOworCWNvbW1vbi0+Y3VycmVudF92Y3B1ID0g
dmNwdTsKKwl2Y3B1LT5jb21tb24gPSBjb21tb247CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGlj
IHZvaWQga3ZtX3ZjcHVfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm0gKmt2
bSwgdW5zaWduZWQgaWQpCiB7CiAJbXV0ZXhfaW5pdCgmdmNwdS0+bXV0ZXgpOwpAQCAtNDU5LDE0
ICs0NzMsMjYgQEAgc3RhdGljIHZvaWQga3ZtX3ZjcHVfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgaWQpCiAJcHJlZW1wdF9ub3RpZmllcl9pbml0
KCZ2Y3B1LT5wcmVlbXB0X25vdGlmaWVyLCAma3ZtX3ByZWVtcHRfb3BzKTsKIAl2Y3B1LT5sYXN0
X3VzZWRfc2xvdCA9IE5VTEw7CiAKKwl2Y3B1LT5wbGFuZV9sZXZlbCA9IDA7CisKIAkvKiBGaWxs
IHRoZSBzdGF0cyBpZCBzdHJpbmcgZm9yIHRoZSB2Y3B1ICovCiAJc25wcmludGYodmNwdS0+c3Rh
dHNfaWQsIHNpemVvZih2Y3B1LT5zdGF0c19pZCksICJrdm0tJWQvdmNwdS0lZCIsCiAJCSB0YXNr
X3BpZF9ucihjdXJyZW50KSwgaWQpOwogfQogCitzdGF0aWMgdm9pZCBrdm1fdmNwdV9jb21tb25f
ZGVzdHJveShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJaWYgKHZjcHUtPnBsYW5lX2xldmVs
ID09IDApCisJCWtmcmVlKHZjcHUtPmNvbW1vbik7CisKKwl2Y3B1LT5jb21tb24gPSBOVUxMOwor
fQorCiBzdGF0aWMgdm9pZCBrdm1fdmNwdV9kZXN0cm95KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
IHsKIAlrdm1fYXJjaF92Y3B1X2Rlc3Ryb3kodmNwdSk7CisKKwlrdm1fdmNwdV9jb21tb25fZGVz
dHJveSh2Y3B1KTsKIAlrdm1fZGlydHlfcmluZ19mcmVlKCZ2Y3B1LT5kaXJ0eV9yaW5nKTsKIAog
CS8qCkBAIC0xMzYwLDggKzEzODYsOCBAQCBzdGF0aWMgdm9pZCBrdm1fZGVzdHJveV92bShzdHJ1
Y3Qga3ZtICprdm0pCiAjaWZkZWYgQ09ORklHX0tWTV9HRU5FUklDX01FTU9SWV9BVFRSSUJVVEVT
CiAJeGFfZGVzdHJveSgma3ZtLT5tZW1fYXR0cl9hcnJheSk7CiAjZW5kaWYKLQlrdm1fYXJjaF9m
cmVlX3ZtKGt2bSk7CiAJa3ZtX2Rlc3Ryb3lfcGxhbmVzKGt2bSk7CisJa3ZtX2FyY2hfZnJlZV92
bShrdm0pOwogCXByZWVtcHRfbm90aWZpZXJfZGVjKCk7CiAJa3ZtX2Rpc2FibGVfdmlydHVhbGl6
YXRpb24oKTsKIAltbWRyb3AobW0pOwpAQCAtNDI0NiwxMSArNDI3MiwxNSBAQCBzdGF0aWMgaW50
IGt2bV92bV9pb2N0bF9jcmVhdGVfdmNwdShzdHJ1Y3Qga3ZtICprdm0sIHVuc2lnbmVkIGxvbmcg
aWQpCiAJCWdvdG8gdmNwdV9kZWNyZW1lbnQ7CiAJfQogCisJciA9IGt2bV92Y3B1X2luaXRfY29t
bW9uKHZjcHUsIGt2bSk7CisJaWYgKHIpCisJCWdvdG8gdmNwdV9mcmVlOworCiAJQlVJTERfQlVH
X09OKHNpemVvZihzdHJ1Y3Qga3ZtX3J1bikgPiBQQUdFX1NJWkUpOwogCXBhZ2UgPSBhbGxvY19w
YWdlKEdGUF9LRVJORUxfQUNDT1VOVCB8IF9fR0ZQX1pFUk8pOwogCWlmICghcGFnZSkgewogCQly
ID0gLUVOT01FTTsKLQkJZ290byB2Y3B1X2ZyZWU7CisJCWdvdG8gdmNwdV9mcmVlX2NvbW1vbjsK
IAl9CiAJdmNwdS0+cnVuID0gcGFnZV9hZGRyZXNzKHBhZ2UpOwogCkBAIC00MzE4LDYgKzQzNDgs
OCBAQCBzdGF0aWMgaW50IGt2bV92bV9pb2N0bF9jcmVhdGVfdmNwdShzdHJ1Y3Qga3ZtICprdm0s
IHVuc2lnbmVkIGxvbmcgaWQpCiAJa3ZtX2FyY2hfdmNwdV9kZXN0cm95KHZjcHUpOwogdmNwdV9m
cmVlX3J1bl9wYWdlOgogCWZyZWVfcGFnZSgodW5zaWduZWQgbG9uZyl2Y3B1LT5ydW4pOwordmNw
dV9mcmVlX2NvbW1vbjoKKwlrdm1fdmNwdV9jb21tb25fZGVzdHJveSh2Y3B1KTsKIHZjcHVfZnJl
ZToKIAlrbWVtX2NhY2hlX2ZyZWUoa3ZtX3ZjcHVfY2FjaGUsIHZjcHUpOwogdmNwdV9kZWNyZW1l
bnQ6Ci0tIAoyLjUzLjAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
