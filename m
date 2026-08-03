Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99042C55179
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 13:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wydaXa5cNdbcj/ZQSuFxhRcUGbCFxlZwHXuwitZDQAQ=; b=ECnngms6P6lQEe
	ijCI4gJDggUaLVDvVQkSDjBT1iMJc/2gmkBvdMpxoIxivW55LcWVGgBjOirXyzhG0x666c7XozzVp
	nyIVc2ae4PvDAE1KRdf5HSY5rSD3VVZ6sS2Pa5mMLA3fu4fJNY54RvpFwdq21T+ptkhBNsmcIF6Md
	/ZYdGgyIPkp/X/Ps7Ad27N7WTU6QBeJGCrm35uCOjCnUuYVXyzvmauXG+USrYq4jb3XOLYLHXjFfM
	tBQCUalhLVApj3+o5sn4tGCcuuWWp8DWq7pRBjo+sqbGHP0YCJIMlq520P9lWbFY/e+cLyHVziETZ
	qdQ2i126T04pbweGIPyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt8k-0000000HH8k-10vl;
	Mon, 03 Aug 2026 13:55:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt8i-0000000HH8I-2Ssx;
	Mon, 03 Aug 2026 13:55:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 192B441AB1;
	Mon,  3 Aug 2026 13:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D471D1F000E9;
	Mon,  3 Aug 2026 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785765336;
	bh=/wWrSnfW58pauafNrE+p0KzqqpQFCnPVL21BrXaLMbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aquetkbGJCwL2l9qEk33SedqffSbzmgdGlkzRTXPNGyUVCVQWi30wZ79AkHKC1sxx
	 lVBBvn0a31gjeQw2TDWBkny2IJdZ2dhcLQGvX1K7SHN3eaib+eWZzMCrsvQZ78hgsk
	 ib9lk0EE+dgK3U5mCi+7hyw8LcZL1ih4UeiwHGdZ86GyIg7SOeoXfQU/YCTlwRRMIZ
	 tvmd4jLnLU55HCHUczdUVKx54bioUztPGKmURbqEkJCxKnrhBLY1/pLE6oA45bMz0s
	 ToRFQV69nd8jvmgDB86aLIX1J6ZN8SniGiRwA6peUuievcOEP7yOLyoU6ZrIfgtGxX
	 bE7TdyAmtXsYg==
From: Guo Ren <guoren@kernel.org>
To: guoyaxing@bosc.ac.cn
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	majiuyue@bosc.ac.cn,
	minachou@andestech.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	"Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
Subject: [PATCH] riscv: KVM: Flush VS-stage stale entries
Date: Mon,  3 Aug 2026 13:54:54 +0000
Message-ID: <20260803135454.2726112-1-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802050015.104795-1-guoyaxing@bosc.ac.cn>
References: <20260802050015.104795-1-guoyaxing@bosc.ac.cn>
MIME-Version: 1.0
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

RnJvbTogIkd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSIgPGd1b3JlbkBrZXJuZWwub3Jn
PgoKV2hlbiBhIHZDUFUgbWlncmF0ZXMgdG8gYSBkaWZmZXJlbnQgaG9zdCBDUFUsIHRoZSBuZXcg
Q1BVIG1heSByZXRhaW4Kc3RhbGUgVlMtc3RhZ2UgVExCIGVudHJpZXMgKEdWQSDihpIgR1BBKSBs
ZWZ0IGJ5IGEgcHJldmlvdXMgcnVuIG9mIHRoZQpzYW1lIGd1ZXN0LiBJc3N1ZSBhbiBIRkVOQ0Uu
VlZNQSAoYWxsIEFTSURzLCBhbGwgYWRkcmVzc2VzKSBpbnNpZGUKa3ZtX3Jpc2N2X21tdV91cGRh
dGVfaGdhdHAoKSB3aGVuZXZlciB0aGUgdkNQVSBpcyBsb2FkZWQgb24gYSBDUFUKZGlmZmVyZW50
IGZyb20gdGhlIG9uZSBpdCBsYXN0IGV4aXRlZCBvbi4KClNpZ25lZC1vZmYtYnk6IEd1byBSZW4g
KEFsaWJhYmEgREFNTyBBY2FkZW15KSA8Z3VvcmVuQGtlcm5lbC5vcmc+Ci0tLQpEb2VzIHRoaXMg
cGF0Y2ggc29sdmUgeW91ciBwcm9ibGVtPyBJIHdvdWxkIHByZWZlciB0byBpc3N1ZSBhIGZ1bGwK
SEZFTkNFLlZWTUEgd2hlbmV2ZXIgYSBuZXcgVk1JRCBpcyBpbnN0YWxsZWQgb24gYSBwQ1BVLgot
LS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX21tdS5oIHwgMiArLQogYXJjaC9yaXNjdi9r
dm0vbW11LmMgICAgICAgICAgICAgfCA1ICsrKystCiBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAg
ICAgICAgICB8IDQgKystLQogMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fbW11Lmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9tbXUuaAppbmRleCA1NDM5ZTc2ZjBhOTYuLmYw
YzVkMmQwMTA1MiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fbW11LmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fbW11LmgKQEAgLTE2LDYgKzE2LDYgQEAg
aW50IGt2bV9yaXNjdl9tbXVfbWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9t
ZW1vcnlfc2xvdCAqbWVtc2xvdCwKIAkJICAgICAgc3RydWN0IGt2bV9nc3RhZ2VfbWFwcGluZyAq
b3V0X21hcCk7CiBpbnQga3ZtX3Jpc2N2X21tdV9hbGxvY19wZ2Qoc3RydWN0IGt2bSAqa3ZtKTsK
IHZvaWQga3ZtX3Jpc2N2X21tdV9mcmVlX3BnZChzdHJ1Y3Qga3ZtICprdm0pOwotdm9pZCBrdm1f
cmlzY3ZfbW11X3VwZGF0ZV9oZ2F0cChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwordm9pZCBrdm1f
cmlzY3ZfbW11X3VwZGF0ZV9oZ2F0cChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBjcHUpOwog
CiAjZW5kaWYKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jIGIvYXJjaC9yaXNjdi9r
dm0vbW11LmMKaW5kZXggMDgyZjliMjYxNzMzLi5iNzZhOTBmNTgxMWEgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL21tdS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCkBAIC03MDUsNyAr
NzA1LDcgQEAgdm9pZCBrdm1fcmlzY3ZfbW11X2ZyZWVfcGdkKHN0cnVjdCBrdm0gKmt2bSkKIAkJ
ZnJlZV9wYWdlcygodW5zaWduZWQgbG9uZylwZ2QsIGdldF9vcmRlcihrdm1fcmlzY3ZfZ3N0YWdl
X3BnZF9zaXplKSk7CiB9CiAKLXZvaWQga3ZtX3Jpc2N2X21tdV91cGRhdGVfaGdhdHAoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KQordm9pZCBrdm1fcmlzY3ZfbW11X3VwZGF0ZV9oZ2F0cChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsIGludCBjcHUpCiB7CiAJc3RydWN0IGt2bV9hcmNoICprYSA9ICZ2Y3B1
LT5rdm0tPmFyY2g7CiAJdW5zaWduZWQgbG9uZyBoZ2F0cCA9IGt2bV9yaXNjdl9nc3RhZ2VfbW9k
ZShrYS0+cGdkX2xldmVscykKQEAgLTcxOCw0ICs3MTgsNyBAQCB2b2lkIGt2bV9yaXNjdl9tbXVf
dXBkYXRlX2hnYXRwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAogCWlmICgha3ZtX3Jpc2N2X2dz
dGFnZV92bWlkX2JpdHMoKSkKIAkJa3ZtX3Jpc2N2X2xvY2FsX2hmZW5jZV9ndm1hX2FsbCgpOwor
CisJaWYgKHZjcHUtPmFyY2gubGFzdF9leGl0X2NwdSAhPSBjcHUpCisJCWFzbSB2b2xhdGlsZShI
RkVOQ0VfVlZNQSh6ZXJvLCB6ZXJvKSA6IDogOiAibWVtb3J5Iik7CiB9CmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKaW5kZXggY2Y2ZTIz
MWU3NmUyLi45NjkyZjVmNWE3MGEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwor
KysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKQEAgLTU5Myw3ICs1OTMsNyBAQCB2b2lkIGt2bV9h
cmNoX3ZjcHVfbG9hZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBjcHUpCiAJCWNzcl93cml0
ZShDU1JfVlNBVFAsIGNzci0+dnNhdHApOwogCX0KIAotCWt2bV9yaXNjdl9tbXVfdXBkYXRlX2hn
YXRwKHZjcHUpOworCWt2bV9yaXNjdl9tbXVfdXBkYXRlX2hnYXRwKHZjcHUsIGNwdSk7CiAKIAlr
dm1fcmlzY3ZfdmNwdV9haWFfbG9hZCh2Y3B1LCBjcHUpOwogCkBAIC02ODYsNyArNjg2LDcgQEAg
c3RhdGljIGludCBrdm1fcmlzY3ZfY2hlY2tfdmNwdV9yZXF1ZXN0cyhzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCiAJCQlrdm1fcmlzY3ZfcmVzZXRfdmNwdSh2Y3B1LCB0cnVlKTsKIAogCQlpZiAoa3Zt
X2NoZWNrX3JlcXVlc3QoS1ZNX1JFUV9VUERBVEVfSEdBVFAsIHZjcHUpKQotCQkJa3ZtX3Jpc2N2
X21tdV91cGRhdGVfaGdhdHAodmNwdSk7CisJCQlrdm1fcmlzY3ZfbW11X3VwZGF0ZV9oZ2F0cCh2
Y3B1LCB2Y3B1LT5jcHUpOwogCiAJCWlmIChrdm1fY2hlY2tfcmVxdWVzdChLVk1fUkVRX0ZFTkNF
X0ksIHZjcHUpKQogCQkJa3ZtX3Jpc2N2X2ZlbmNlX2lfcHJvY2Vzcyh2Y3B1KTsKLS0gCjIuNDMu
MAoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
