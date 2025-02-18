Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DE9C021AA
	for <kvm-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 19:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ac8F7IubYKbYZiCEU6+fPnATAbFJU9oNABsxj8Py9wI=; b=vbojar90dh17Vu
	NT+pjgjRTMZMGIpaaekm5QpAZ+ip59v5GpT61E7HHr3erZL8kmIBGBrMMkEQLQL+duVCZJGIlwxun
	wQ+XgFxMs9VsjCz1G1tv4qqVQVlMscu/P9tBdVehhhQfPuOyROHBVfNgnJ60rqcEs7S5agEJQ/Ruh
	sJH0RYVFeYHMRIZAKl9J5o8cz9NLzBH0vFmBuTFXVALf793JAxpXD5RLGdMA2eUXDpEliIBFnXiIq
	rUhsNFnBX/ZbmOTGrocgYbci00kUakEhppbLOCh7bi83pJDiWU1msFQ8pB88vPSw7SjnVExcSlOrQ
	IJio7yr/pyCij124mh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkT8s-00000009Xwz-3fXW;
	Tue, 18 Feb 2025 19:20:26 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSjW-00000009RpR-0YFG
	for kvm-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 18:54:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739904851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X5VmbHmSLL7bt5QcUJi7mKPCp4uvUAQ1f7vqKZlhdSg=;
	b=um+AtWFwj9c2vcili7S2p5F8QlLDV+vv9Ak9gWUjbBTAmJwvXzJR4XkjbJ2nwKgfjP2zm4
	xawSY8RHEXIkP4CzBd1k39EYLW2Upwuu7BNAYMJnCUK/c2byUMgYo5l0p95Vrvqyxim335
	asa1OxNISkUzcdY8N2ktN8bRWga3qTU=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: cleger@rivosinc.com,
	atishp@rivosinc.com
Subject: [kvm-unit-tests PATCH v2 2/3] riscv: sbi: Export sbiret_report/check
Date: Tue, 18 Feb 2025 19:54:03 +0100
Message-ID: <20250218185401.41250-7-andrew.jones@linux.dev>
In-Reply-To: <20250218185401.41250-5-andrew.jones@linux.dev>
References: <20250218185401.41250-5-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105414_766765_2404E81D 
X-CRM114-Status: UNSURE (   8.24  )
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

QXMgbW9yZSBTQkkgdGVzdHMgYXJlIHdyaXR0ZW4gbm90IGFsbCB3aWxsIGJlIGluIHJpc2N2L3Ni
aS5jLiBFeHBvcnQKc2JpcmV0IHJlcG9ydGluZyBmdW5jdGlvbnMgdG8gYmUgdXNlZCBpbiBvdGhl
ciBTQkkgdGVzdCBmaWxlcy4KClJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQGxp
bnV4LmRldj4KLS0tCiByaXNjdi9zYmktdGVzdHMuaCB8IDIxICsrKysrKysrKysrKysrKysrKysr
KwogcmlzY3Yvc2JpLmMgICAgICAgfCAxNyAtLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9yaXNj
di9zYmktdGVzdHMuaCBiL3Jpc2N2L3NiaS10ZXN0cy5oCmluZGV4IGNlMTI5OTY4ZmU5OS4uMmJk
Yzk0NDBkODJkIDEwMDY0NAotLS0gYS9yaXNjdi9zYmktdGVzdHMuaAorKysgYi9yaXNjdi9zYmkt
dGVzdHMuaApAQCAtMzMsNCArMzMsMjUgQEAKICNkZWZpbmUgU0JJX1NVU1BfVEVTVF9IQVJUSUQJ
KDEgPDwgMikKICNkZWZpbmUgU0JJX1NVU1BfVEVTVF9NQVNLCTcKIAorI2lmbmRlZiBfX0FTU0VN
QkxZX18KKyNpbmNsdWRlIDxhc20vc2JpLmg+CisKKyNkZWZpbmUgc2JpcmV0X3JlcG9ydChyZXQs
IGV4cGVjdGVkX2Vycm9yLCBleHBlY3RlZF92YWx1ZSwgZm10LCAuLi4pICh7CQkJCQkJXAorCWxv
bmcgZXhfZXJyID0gZXhwZWN0ZWRfZXJyb3I7CQkJCQkJCQkJCVwKKwlsb25nIGV4X3ZhbCA9IGV4
cGVjdGVkX3ZhbHVlOwkJCQkJCQkJCQlcCisJYm9vbCBjaF9lcnIgPSAocmV0KS0+ZXJyb3IgPT0g
ZXhfZXJyOwkJCQkJCQkJCVwKKwlib29sIGNoX3ZhbCA9IChyZXQpLT52YWx1ZSA9PSBleF92YWw7
CQkJCQkJCQkJXAorCWJvb2wgcGFzcyA9IHJlcG9ydChjaF9lcnIgJiYgY2hfdmFsLCBmbXQsICMj
X19WQV9BUkdTX18pOwkJCQkJCVwKKwkJCQkJCQkJCQkJCQkJXAorCWlmICghcGFzcykJCQkJCQkJ
CQkJCQlcCisJCXJlcG9ydF9pbmZvKGZtdCAiOiBleHBlY3RlZCAoZXJyb3I6ICVsZCwgdmFsdWU6
ICVsZCksIHJlY2VpdmVkOiAoZXJyb3I6ICVsZCwgdmFsdWUgJWxkKSIsCVwKKwkJCSAgICAjI19f
VkFfQVJHU19fLCBleF9lcnIsIGV4X3ZhbCwgKHJldCktPmVycm9yLCAocmV0KS0+dmFsdWUpOwkJ
CQlcCisJCQkJCQkJCQkJCQkJCVwKKwlwYXNzOwkJCQkJCQkJCQkJCQlcCit9KQorCisjZGVmaW5l
IHNiaXJldF9jaGVjayhyZXQsIGV4cGVjdGVkX2Vycm9yLCBleHBlY3RlZF92YWx1ZSkgXAorCXNi
aXJldF9yZXBvcnQocmV0LCBleHBlY3RlZF9lcnJvciwgZXhwZWN0ZWRfdmFsdWUsICJjaGVjayBz
YmkuZXJyb3IgYW5kIHNiaS52YWx1ZSIpCisKKyNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KICNl
bmRpZiAvKiBfUklTQ1ZfU0JJX1RFU1RTX0hfICovCmRpZmYgLS1naXQgYS9yaXNjdi9zYmkuYyBi
L3Jpc2N2L3NiaS5jCmluZGV4IDlmNTkxZjhmZjc2YS4uM2VjYThjN2UzNWVkIDEwMDY0NAotLS0g
YS9yaXNjdi9zYmkuYworKysgYi9yaXNjdi9zYmkuYwpAQCAtMTU2LDIzICsxNTYsNiBAQCBzdGF0
aWMgYm9vbCBnZXRfaW52YWxpZF9hZGRyKHBoeXNfYWRkcl90ICpwYWRkciwgYm9vbCBhbGxvd19k
ZWZhdWx0KQogCXJldHVybiBmYWxzZTsKIH0KIAotI2RlZmluZSBzYmlyZXRfcmVwb3J0KHJldCwg
ZXhwZWN0ZWRfZXJyb3IsIGV4cGVjdGVkX3ZhbHVlLCBmbXQsIC4uLikgKHsJCQkJCQlcCi0JbG9u
ZyBleF9lcnIgPSBleHBlY3RlZF9lcnJvcjsJCQkJCQkJCQkJXAotCWxvbmcgZXhfdmFsID0gZXhw
ZWN0ZWRfdmFsdWU7CQkJCQkJCQkJCVwKLQlib29sIGNoX2VyciA9IChyZXQpLT5lcnJvciA9PSBl
eF9lcnI7CQkJCQkJCQkJXAotCWJvb2wgY2hfdmFsID0gKHJldCktPnZhbHVlID09IGV4X3ZhbDsJ
CQkJCQkJCQlcCi0JYm9vbCBwYXNzID0gcmVwb3J0KGNoX2VyciAmJiBjaF92YWwsIGZtdCwgIyNf
X1ZBX0FSR1NfXyk7CQkJCQkJXAotCQkJCQkJCQkJCQkJCQlcCi0JaWYgKCFwYXNzKQkJCQkJCQkJ
CQkJCVwKLQkJcmVwb3J0X2luZm8oZm10ICI6IGV4cGVjdGVkIChlcnJvcjogJWxkLCB2YWx1ZTog
JWxkKSwgcmVjZWl2ZWQ6IChlcnJvcjogJWxkLCB2YWx1ZSAlbGQpIiwJXAotCQkJICAgICMjX19W
QV9BUkdTX18sIGV4X2VyciwgZXhfdmFsLCAocmV0KS0+ZXJyb3IsIChyZXQpLT52YWx1ZSk7CQkJ
CVwKLQkJCQkJCQkJCQkJCQkJXAotCXBhc3M7CQkJCQkJCQkJCQkJCVwKLX0pCi0KLSNkZWZpbmUg
c2JpcmV0X2NoZWNrKHJldCwgZXhwZWN0ZWRfZXJyb3IsIGV4cGVjdGVkX3ZhbHVlKSBcCi0Jc2Jp
cmV0X3JlcG9ydChyZXQsIGV4cGVjdGVkX2Vycm9yLCBleHBlY3RlZF92YWx1ZSwgImNoZWNrIHNi
aS5lcnJvciBhbmQgc2JpLnZhbHVlIikKLQogc3RhdGljIHZvaWQgY2hlY2tfYmFzZSh2b2lkKQog
ewogCXN0cnVjdCBzYmlyZXQgcmV0OwotLSAKMi40OC4xCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
