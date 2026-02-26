Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538DCFC5913
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 09:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sXNKqTlmm4gCxUlKyzS+RN87CPTUPmK4/QCNreGwXu8=; b=FVkeiROcPJ1Sjb
	3bdmQ2l28JHYR/3eTIzxhg+4u5C2IhH768D5LWHoAxN86DSCbaCKt1BEb/9idgRwYgsz/1aCTfLQu
	UzoxoYgsq6Pmn9gwE9BujgYBxWxOOCi31DNAH1KuYFeMxza7lu2HFeiFnKpkiwc20G6j5K47zwu9A
	uzKCPp35N3woGDvjUbkFqAlMGNeLzWoHffOfHIx7N6MT5u+vjtP1nYxfTWU2PYCAu/DvN4ymVKfGt
	FWF/EkIksJ8H5cJO6gwZHL5hC4jEIwwAe/QD79JORrm+3vM+NhU9yNzXGdOvOs68FZQZM0L6fRu+R
	ezBHQCtxj4LuKOYLRxww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXaQ-00000005mje-01nJ;
	Thu, 26 Feb 2026 09:23:10 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXaN-00000005mgj-0ovA;
	Thu, 26 Feb 2026 09:23:08 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4fM5bG064Bz51SW9;
	Thu, 26 Feb 2026 17:22:50 +0800 (CST)
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
	by mse-fl1.zte.com.cn with SMTP id 61Q9MgoL033919;
	Thu, 26 Feb 2026 17:22:42 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxl2zmapp07[null])
	by mapi (Zmail) with MAPI id mid12;
	Thu, 26 Feb 2026 17:22:45 +0800 (CST)
X-Zmail-TransId: 2b0969a010e5ff4-658a5
X-Mailer: Zmail v1.0
Message-ID: <20260226172245358qVZavIykLL2QC0KoqTO-I@zte.com.cn>
Date: Thu, 26 Feb 2026 17:22:45 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UklTQy1WOiBLVk06IEZpeCBodWdlcGFnZSBtYXBwaW5nIGhhbmRsaW5nIGR1cmluZyBkaXJ0eSBsb2dnaW5n?=
X-MAIL: mse-fl1.zte.com.cn 61Q9MgoL033919
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Thu, 26 Feb 2026 17:22:50 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69A010EA.000/4fM5bG064Bz51SW9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_012307_396773_4417EBF0 
X-CRM114-Status: UNSURE (   7.86  )
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

RnJvbTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+CgpXaGVuIGRpcnR5
IGxvZ2dpbmcgaXMgZW5hYmxlZCwgdGhlIGdzdGFnZSBwYWdlIHRhYmxlcyBtdXN0IGJlIG1hcHBl
ZAphdCBQQUdFX1NJWkUgZ3JhbnVsYXJpdHkgdG8gdHJhY2sgZGlydHkgcGFnZXMgYWNjdXJhdGVs
eS4gQ3VycmVudGx5LAppZiBhIGh1Z2UgUFRFIGlzIGVuY291bnRlcmVkIGR1cmluZyB0aGUgd3Jp
dGUtcHJvdGVjdCBmYXVsdCwgdGhlIGNvZGUKcmV0dXJucyAtRUVYSVNULCB3aGljaCBicmVha3Mg
Vk0gbWlncmF0aW9uLgoKSW5zdGVhZCBvZiByZXR1cm5pbmcgYW4gZXJyb3IsIGRyb3AgdGhlIGh1
Z2UgUFRFIGFuZCBtYXAgb25seSB0aGUgcGFnZQp0aGF0IGlzIGN1cnJlbnRseSBiZWluZyBhY2Nl
c3NlZC4gVGhpcyBvbuKAkWRlbWFuZCBhcHByb2FjaCBhdm9pZHMgdGhlCm92ZXJoZWFkIG9mIHNw
bGl0dGluZyB0aGUgZW50aXJlIGh1Z2UgcGFnZSBpbnRvIHNtYWxsIHBhZ2VzIHVwZnJvbnQuCgpT
aWduZWQtb2ZmLWJ5OiBXYW5nIFllY2hhbyA8d2FuZy55ZWNoYW8yNTVAenRlLmNvbS5jbj4KLS0t
CiBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFn
ZS5jIGIvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMKaW5kZXggYjY3ZDYwZDcyMmMyLi4xNmM4YWZk
YWZiZmIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCisrKyBiL2FyY2gvcmlz
Y3Yva3ZtL2dzdGFnZS5jCkBAIC0xMzQsNyArMTM0LDcgQEAgaW50IGt2bV9yaXNjdl9nc3RhZ2Vf
c2V0X3B0ZShzdHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLAoKICAgICAgICB3aGlsZSAoY3VycmVu
dF9sZXZlbCAhPSBtYXAtPmxldmVsKSB7CiAgICAgICAgICAgICAgICBpZiAoZ3N0YWdlX3B0ZV9s
ZWFmKHB0ZXApKQotICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVFWElTVDsKKyAgICAg
ICAgICAgICAgICAgICAgICAgc2V0X3B0ZShwdGVwLCBfX3B0ZSgwKSk7CgogICAgICAgICAgICAg
ICAgaWYgKCFwdGVfdmFsKHB0ZXBfZ2V0KHB0ZXApKSkgewogICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoIXBjYWNoZSkKLS0gCjIuMjcuMAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
