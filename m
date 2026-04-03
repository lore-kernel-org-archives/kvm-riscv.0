Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5860CD73088
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 02:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fgxmcIGaJ76mM/9Ep38RLz/0Qr286fBzClRnjOEqaA=; b=zwK1DOYGS9DmJ8
	pS2zpK/CS8zx5nMQ1NyJOpNeOZ/FfWlzRuf2bfehB0WcixZMDMzUeD8kDZcL4B6RoQj3y6/cniAf4
	fcP6Pf4Wmu2d46OAxUFy1k9Ukof3YBgHQyiuBaiz6DnV0kEaTXOXL1q47OtPFr/APZGNNHtLON8Zu
	tjCFPfJfY/t0M0Afi3w15oEMQZwzpIW1WPWBSvOTa1MS57dk1Ti1X6U7jJEpZXwfxEHemYoLHZKgN
	od2hPoUGGJdEdspydKCgfm5cxsQWaQ2iV/aD5eKI5Yw6LTEjKsDizMg3u9TuCTn4uDpXoIxrVEbGf
	GdBn4lic5vdRZ0Nn9QVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8UKO-000000016To-3wEe;
	Fri, 03 Apr 2026 02:32:08 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8UKJ-000000016TP-1bXL;
	Fri, 03 Apr 2026 02:32:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1775183519; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=MwMGTOvDH+UUgg3XppNhDJ7Wm/kQtmd8riFK4rQdv6Y=;
	b=gIb3sXRtTzvWWEMoZomvdn0YuUNRqUyhL/1M2LX9djxryfVzoFVsKLRlAqej9W3TQiSKf9JzvIVznxgUi7M3/UnpEkhLNRbgDg/t0syRgItQItSe/rBw/60/nipbicfNSRsJKXMJPWoHxkA0iD1JvxmGhyFMlNDrsQBnrK+mfgo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X0IegUK_1775183514;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X0IegUK_1775183514 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 10:31:56 +0800
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
Subject: Re: Re: [PATCH v7 3/4] RISC-V: KVM: Detect and expose supported HGATP G-stage modes 
Date: Fri,  3 Apr 2026 10:31:49 +0800
Message-Id: <20260403023149.40338-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <DHIVKK81LLM2.3VTYW1UXM6USQ@oss.qualcomm.com>
References: <DHIVKK81LLM2.3VTYW1UXM6USQ@oss.qualcomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_193206_390817_0EEE6016 
X-CRM114-Status: UNSURE (   5.38  )
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

Pj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+Cj4+IEV4
dGVuZCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KCkgdG8gcmVjb3JkIEhHQVRQLk1PREUg
dmFsdWVzIGluIGEKPj4gYml0bWFzay4gS2VlcCB0cmFja2luZyB0aGUgbWF4aW11bSBzdXBwb3J0
ZWQgRy1zdGFnZSBwYWdlIHRhYmxlIGxldmVsCj4+IGZvciBleGlzdGluZyBpbnRlcm5hbCB1c2Vy
cy4KPj4KPj4gQWxzbyBwcm92aWRlIGxpZ2h0d2VpZ2h0IGhlbHBlcnMgdG8gcmV0cmlldmUgdGhl
IHN1cHBvcnRlZC1tb2RlIGJpdG1hc2sKPj4gYW5kIHZhbGlkYXRlIGEgcmVxdWVzdGVkIEhHQVRQ
Lk1PREUgYWdhaW5zdCBpdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRmFuZ3l1IFl1IDxmYW5neXUu
eXVAbGludXguYWxpYmFiYS5jb20+Cj4+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJl
dy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPgo+PiBSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVu
QGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1fZ3N0YWdlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaAo+PiBA
QCAtMTAyLDQgKzEwMywxNCBAQCBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX3Jpc2N2X2dzdGFnZV9p
bml0KHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2UsIHN0cnVjdCBrdm0gKgo+PiArc3RhdGljIGlu
bGluZSBib29sIGt2bV9yaXNjdl9oZ2F0cF9tb2RlX2lzX3ZhbGlkKHVuc2lnbmVkIGxvbmcgbW9k
ZSkKPj4gK3sKPj4gKwlyZXR1cm4ga3ZtX3Jpc2N2X2dzdGFnZV9zdXBwb3J0ZWRfbW9kZV9tYXNr
ICYgQklUKG1vZGUpOwo+Cj5TaGlmdGluZyBieSBtb3JlIHRoYW4gdGhlIGJpdCB3aWR0aCBpcyB1
bmRlZmluZWQgYmVoYXZpb3IgaW4gQy4KPlJWNjQgZWZmZWN0aXZlbHkgdHJhbnNsYXRlcyBCSVQo
bW9kZSkgdG8gMVVMIDw8IChtb2RlICYgMHgzZiksIHNvIHRoaXMKPmNvdWxkIGFsbG93IHZhbHVl
cyBsYXJnZXIgdGhhbiB0aGUgbWFzay4KPgoKVGhhbmtzIGZvciBjYXRjaGluZyB0aGlzLgoKWW91
4oCZcmUgcmlnaHQ6IEJJVChtb2RlKSBpcyB1bmRlZmluZWQgZm9yIG91dC1vZi1yYW5nZSBzaGlm
dHMsIGFuZCBvbiBSVjY0IGl0IGNhbgplZmZlY3RpdmVseSBtYXNrIHRoZSBzaGlmdCBhbW91bnQs
IHBvdGVudGlhbGx5IG1ha2luZyBpbnZhbGlkIE1PREUgdmFsdWVzIGFwcGVhcgp2YWxpZC4gSW4g
djggSeKAmWxsIGFkZCBhbiBleHBsaWNpdCBib3VuZHMgY2hlY2sgYmVmb3JlIHNoaWZ0aW5nLgoK
VGhhbmtzLApGYW5neXUKCj5UaGFua3MuCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
