Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83991D7308C
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 02:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dy9tBXyEBil5LGG9ErngaBvsVPi7LpabSpZajVRHkuo=; b=CLpp6+YwlaPMMz
	mrxQXSNcRM5w+y/ZvUA7GJtP7jmRXSJCeBQ7eBAdOkwhp6jqOCT2TlCUMEZsmwWZ3oyhMjHH2ZkRk
	2nKgJ/Z8jElXLBuDgImGS1tqh/utaX47ka1ivILsgBVoQ/SKlp8KfpjO0JUPf6ISYgMPBsmEXka5K
	L6/uViLrHgClzPKRFqf0TXqddNf5swO9smwZvOjIZF5YGCHIyRjxYJuTBpW+0tiogS1kvFldcc0AE
	DXuzXvmVZ+Uo/5/qN1b3rkGZZMo1h2qkVFnClCEGlZXXBF7mjDy068wOqIgGdOhfa9It01WNM6ZeE
	npFbC0tTNQsCY4eFhjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8UlE-000000017dC-41n9;
	Fri, 03 Apr 2026 02:59:52 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8UlA-000000017cV-2mg5;
	Fri, 03 Apr 2026 02:59:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1775185183; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=hz8Xf0WjqAmv02QAnNq4g/lk3QXHFKGIGokcVeGTTF4=;
	b=B986jNBKMGo1IJA+kIrcLCKVTxNX9SgZ32f9+lYPtIyqtr10HpQ0QlHANsR78PGZZ8uDRt8WU252nkpGo1jwRO+LLaVbGCWwTkXrwy2ab/anNuBwhR/DSapy3dpkdzdHGUkuqzgqJGzdVdXKaN95zxyngCV3px7L5oZ4GyHdmxk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R391e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X0IpQik_1775185180;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X0IpQik_1775185180 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 10:59:42 +0800
From: fangyu.yu@linux.alibaba.com
To: radim.krcmar@oss.qualcomm.com
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	corbet@lwn.net,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pbonzini@redhat.com,
	pjw@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: Re: [PATCH v7 4/4] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE 
Date: Fri,  3 Apr 2026 10:59:39 +0800
Message-Id: <20260403025939.43841-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <DHIVQI1DY4MK.27YZ2NPDXF5WM@oss.qualcomm.com>
References: <DHIVQI1DY4MK.27YZ2NPDXF5WM@oss.qualcomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_195949_576980_FD6D78A5 
X-CRM114-Status: UNSURE (   6.89  )
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

Pj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+Cj4+IEFk
ZCBhIFZNIGNhcGFiaWxpdHkgdGhhdCBhbGxvd3MgdXNlcnNwYWNlIHRvIHNlbGVjdCB0aGUgRy1z
dGFnZSBwYWdlIHRhYmxlCj4+IGZvcm1hdCBieSBzZXR0aW5nIEhHQVRQLk1PREUgb24gYSBwZXIt
Vk0gYmFzaXMuCj4+Cj4+IFVzZXJzcGFjZSBlbmFibGVzIHRoZSBjYXBhYmlsaXR5IHZpYSBLVk1f
RU5BQkxFX0NBUCwgcGFzc2luZyB0aGUgcmVxdWVzdGVkCj4+IEhHQVRQLk1PREUgaW4gYXJnc1sw
XS4gVGhlIHJlcXVlc3QgaXMgcmVqZWN0ZWQgd2l0aCAtRUlOVkFMIGlmIHRoZSBtb2RlIGlzCj4+
IG5vdCBzdXBwb3J0ZWQgYnkgdGhlIGhvc3QsIGFuZCB3aXRoIC1FQlVTWSBpZiB0aGUgVk0gaGFz
IGFscmVhZHkgYmVlbgo+PiBjb21taXR0ZWQgKGUuZy4gdkNQVXMgaGF2ZSBiZWVuIGNyZWF0ZWQg
b3IgYW55IG1lbXNsb3QgaXMgcG9wdWxhdGVkKS4KPj4KPj4gS1ZNX0NIRUNLX0VYVEVOU0lPTihL
Vk1fQ0FQX1JJU0NWX1NFVF9IR0FUUF9NT0RFKSByZXR1cm5zIGEgYml0bWFzayBvZiB0aGUKPj4g
SEdBVFAuTU9ERSBmb3JtYXRzIHN1cHBvcnRlZCBieSB0aGUgaG9zdC4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+IFJldmlld2Vk
LWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPgo+PiBSZXZp
ZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rdm0vdm0uYyBiL2FyY2gvcmlzY3Yva3ZtL3ZtLmMKPj4gQEAgLTIxMSwx
MiArMjE0LDIzIEBAIGludCBrdm1fdm1faW9jdGxfY2hlY2tfZXh0ZW5zaW9uKHN0cnVjdCBrdm0g
Kmt2bSwgbG9uZyBleHQpCj4+Cj4+ICBpbnQga3ZtX3ZtX2lvY3RsX2VuYWJsZV9jYXAoc3RydWN0
IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX2VuYWJsZV9jYXAgKmNhcCkKPj4gIHsKPj4gKwljYXNlIEtW
TV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREU6Cj4+ICsJCWlmICgha3ZtX3Jpc2N2X2hnYXRwX21v
ZGVfaXNfdmFsaWQoY2FwLT5hcmdzWzBdKSkKPj4gKwkJCXJldHVybiAtRUlOVkFMOwo+PiArCj4+
ICsJCWlmIChrdm0tPmNyZWF0ZWRfdmNwdXMgfHwgIWt2bV9hcmVfYWxsX21lbXNsb3RzX2VtcHR5
KGt2bSkpCj4+ICsJCQlyZXR1cm4gLUVCVVNZOwo+Cj5TaW5jZSBtdWx0aXBsZSBWTSBpb2N0bHMg
Y2FuIGV4ZWN1dGUgY29uY3VycmVudGx5LCBJIHdvdWxkIHByb3RlY3QKPmNyZWF0ZWRfdmNwdXMg
Ynkga3ZtLT5sb2NrIGFuZCBrdm1fYXJlX2FsbF9tZW1zbG90c19lbXB0eSBieQo+a3ZtLT5zbG90
c19sb2NrLgo+CgpBZ3JlZWQuIEnigJlsbCBwcm90ZWN0IGNyZWF0ZWRfdmNwdXMgd2l0aCBrdm0t
PmxvY2sgYW5kIGNhbGwKa3ZtX2FyZV9hbGxfbWVtc2xvdHNfZW1wdHkoKSB1bmRlciBrdm0tPnNs
b3RzX2xvY2ssIGZvbGxvd2luZyB0aGUKa3ZtLT5sb2NrIC0+IGt2bS0+c2xvdHNfbG9jayBvcmRl
cmluZyBpbiB2OC4KClRoYW5rcywKRmFuZ3l1Cgo+VGhhbmtzLgoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
