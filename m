Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C32CF65DD
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtPb4/6KmmlqEFZQ8q0ZglQX2JfJMs5HZE9HpQuMZRQ=; b=gWwyHk7Pr2UNWf
	F6tn2/VCymhsA3zGI7wYH3e1F6/d9HhrsDRTGL0igW/AsA2BIN5eouiLgrvh18mtFlrPK8JzvSDAB
	A7FnJHoJ3ZH32jVwaJP56Acn68Fq9Rnb+uxeJRX18AJ49vxBhL41JFYY4hl0SDhNBU2pvnarcVAYj
	4ElxzTCPyLPZ0syadRBYHiW19hld2NqEXf9Y36HAJeAv8VosYGIEj0pv5hJzCBrIdYuY3bzZXYqTS
	gr/pYi6wrM5UzWGIi3x58vpoF+LqYsARw+rF3XZ+vumi1VcYv2evSpa7Oh9e9PMmfrQoBpDRLelNt
	DldD6Oncww92Ua81thpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKRF-0000000CO3M-1kFx;
	Mon, 26 Jan 2026 11:07:21 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKRB-0000000CO2B-3ckx
	for kvm-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 11:07:19 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-5f54d6b4047so2574029137.0
        for <kvm-riscv@lists.infradead.org>; Mon, 26 Jan 2026 03:07:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769425634; cv=none;
        d=google.com; s=arc-20240605;
        b=K74ei+7aZqKfgXvLwIWU9w9DwXBevZeqn4wNEiN4RglrikKzuk0JkErgAA+quS3Ykf
         WGYsR0YOgn+ghH0Tp44SJ1ngS6snU7n15uFe29OPARIBeZa3I7IOvN95PseLGS/CKL3s
         Zl0jCgd9PyM/7ZfRJ1p2BHLYmv7mWp4Zdi1SfvlyzrEUO3H/t2sU3JDa4HFBlFJGCH+D
         vRzkl22wDG2J7/uKMM28IaM7JnuCKTkrIS0qML4mFYb72Bt1YzJxDRhTbT2n787U3Px8
         4nOkNfhDiUmfJJjnkshYYsHOZP0w+8w5tpS/niOG3YiL6Jx+r0aituNZbkt9RhiP6GfK
         vyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jikz4suWiAmlsF3qFodUwFSeL7ZT9eIQaxTBBzP1rbc=;
        fh=twrZM6lC9zyegXo24ED8jMosbUTQtGAwMUptDRwF5eU=;
        b=SHTRmE9+dEzVoDvhpkfdLJbJljLZiQMgDhMZHEGhCn97EmXSJTWjViAPWP2F7T9w9K
         /iHIr6B57NXp1A12z7sk3QTQYZ3o0/NC2WyKQM0JLcvnJoSEZ5Z2AzIzda9FPGVtKmuq
         5PhjyBmzhzKwI7K1Bv80AnjV/OTynt7Kz0KVmndeaQrl2TTZJcfhD+sw0Mpa7aWTPOUt
         0lpUOcCNc+5l/OsDJcY+Z1sFkEARkOJg7RYCy+kX6J0co92+/9r3ob3OLpq3me15xaL+
         KI3O8lr+NMc61E88AmVy9bJzROGceaffjHxQ2W7OojXh5hJ9JuMBod380xKeTlHgFWg3
         dmRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1769425634; x=1770030434; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jikz4suWiAmlsF3qFodUwFSeL7ZT9eIQaxTBBzP1rbc=;
        b=TcQxdKiSqFg3SFrEuotsFFLVpnbaM4Mk1IQpRcjHPZYZ+wE9oXSXGeVmgP1lHTNtQT
         25wkJfOM2ZezK5vASSgZqp61iQo8fPCBwYAdy/GmydsA2zfFMTcfaD0ratMFEdk2KshU
         XT6Rqbz1MsXjiGnDlytOn7mADBhaWGjGo5Kvidn7ELHTmJ1ZvR5KMFkaMKJHiwCNaMRf
         AYhQR1rYpuN0yIkFiHiYTcNsCZiJDio7McKlqdwnsVsE3NtVz+08g6sfDG9uw5+mVfTG
         hEnMlZiJ57TKMuWWnB3pXlnywBQNVmO7RChENHSAptI+epcpT3L+sv6lGIhrX9MuiU4b
         nAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769425634; x=1770030434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jikz4suWiAmlsF3qFodUwFSeL7ZT9eIQaxTBBzP1rbc=;
        b=lFzOm5BOHR/qAXrhtjXnGLaQgGlqnzKdgJaO1Ye/ustm5kLY9T8hMA5QDSZo+48m0a
         Qu32H06ATHuxJjwbNgJeGQuLqpJcB7KHYEcjb3lfPzeAPVH2TVkB4TFgIHpJtydUKDGZ
         NKuEcQPS8cOvc4bOPwbs2JPb56hEj+8rCCVqszdlAE6+HVE5BsY0rN4+1fls8Vo5eJ0G
         MY7oi99RiTKBVWdEroKBU7vgZS5fhDvAAA8TcvV5DzWArfHVMo3DBCxepsNn9DwFxRcN
         26/0uh7hQMlI1YTYzqGgtKi+RKiiqsvqZBJs/2yfeOItr+aGd5a8lJhvGpLOatLQHcYf
         e2iw==
X-Forwarded-Encrypted: i=1; AJvYcCVpqSsRhrQrUlTEkQQeiFHL5h21S97uFQDRFtxjaB07l9s6VaUngQHqQmuhF8VdpK/UpnGgvAfjE/c=@lists.infradead.org
X-Gm-Message-State: AOJu0YzW8g7keLJQiTd9diUHvaeClf0fHY7e5hBxfBvcIai9p3rzRfOo
	+O91wfu/gxxUzLQZdljr3rd8jeVGfvhnkB8eNYfagJTs46Fg/y3q7I+HtM1i1NvlWAhKJ9IozfR
	dT60+BVWM8i5HtoPZWO3bxJdjw700IB35d8Rm1YpoZw==
X-Gm-Gg: AZuq6aJ+omenkwlJrGOi2ZELV/l5zTQhTeQRinogiqyBpUJZYmxgsJLcv95gWjsOItp
	RhsUQcDCNqNvG4IL3XjW/SJqxAZ3yjbc2Hozk1Cr27kHywvPMiAf64IK/nZyvCCH6ChPhr93bno
	p8oAhigEZJ4GgyH6qMG/QYgZ0AHIPvnEW7DZQ9qqiGVOksmYQ2nj36PI0LoJWQZYMIRAqXm+/VD
	3lc+/lImCzyZ2fwJxFVjNguSoBg03BYT3V83pVVpc1VY7I29zj99HdACXM/DBCq869x2W3EaHxk
	c4iYViIv
X-Received: by 2002:a05:6102:508d:b0:5f5:4d1c:89bd with SMTP id
 ada2fe7eead31-5f5762c8c17mr1115604137.1.1769425633883; Mon, 26 Jan 2026
 03:07:13 -0800 (PST)
MIME-Version: 1.0
References: <20260104133457.57742-1-luxu.kernel@bytedance.com> <CAAhSdy0krY4ou9TpGV=SKUKPNwgweB58QetUajb3HE5Jfy_RbA@mail.gmail.com>
In-Reply-To: <CAAhSdy0krY4ou9TpGV=SKUKPNwgweB58QetUajb3HE5Jfy_RbA@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 26 Jan 2026 19:07:03 +0800
X-Gm-Features: AZwV_Qg9Lpwqzh241-drclbSZB5_WXa_xHTaLQJyXwpF4Hv4QYndrPF9zzxEs0w
Message-ID: <CAPYmKFsAcik3YjO19K1aoGHeqaq9qsx-JeHjoqLLAXp9-t-pKg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5] irqchip/riscv-imsic: Adjust the number
 of available guest irq files
To: Anup Patel <anup@brainfault.org>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@linutronix.de, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_030717_923404_6F4D1995 
X-CRM114-Status: GOOD (  31.30  )
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

T24gTW9uLCBKYW4gMjYsIDIwMjYgYXQgNjo1NOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gU3VuLCBKYW4gNCwgMjAyNiBhdCA3OjA14oCvUE0gWHUg
THUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4KPiA+IEN1cnJlbnRseSwg
S1ZNIGFzc3VtZXMgdGhlIG1pbmltdW0gb2YgaW1wbGVtZW50ZWQgSEdFSUUgYml0cyBhbmQKPiA+
ICJCSVQoZ2MtPmd1ZXN0X2luZGV4X2JpdHMpIC0gMSIgYXMgdGhlIG51bWJlciBvZiBndWVzdCBm
aWxlcyBhdmFpbGFibGUKPiA+IGFjcm9zcyBhbGwgQ1BVcy4gVGhpcyB3aWxsIG5vdCB3b3JrIHdo
ZW4gQ1BVcyBoYXZlIGRpZmZlcmVudCBudW1iZXIKPiA+IG9mIGd1ZXN0IGZpbGVzIGJlY2F1c2Ug
S1ZNIG1heSBpbmNvcnJlY3RseSBhbGxvY2F0ZSBhIGd1ZXN0IGZpbGUgb24gYQo+ID4gQ1BVIHdp
dGggZmV3ZXIgZ3Vlc3QgZmlsZXMuCj4gPgo+ID4gVG8gYWRkcmVzcyBhYm92ZSwgZHVyaW5nIGlu
aXRpYWxpemF0aW9uLCBjYWxjdWxhdGUgdGhlIG51bWJlciBvZgo+ID4gYXZhaWxhYmxlIGd1ZXN0
IGludGVycnVwdCBmaWxlcyBhY2NvcmRpbmcgdG8gTU1JTyByZXNvdXJjZXMgYW5kCj4gPiBjb25z
dHJhaW4gdGhlIG51bWJlciBvZiBndWVzdCBpbnRlcnJ1cHQgZmlsZXMgdGhhdCBjYW4gYmUgYWxs
b2NhdGVkCj4gPiBieSBLVk0uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2Vy
bmVsQGJ5dGVkYW5jZS5jb20+Cj4KPiBQbGVhc2UgY2FycnkgUmV2aWV3ZWQtYnkgYW5kIEFja2Vk
LWJ5IHRhZ3Mgb2J0YWluZWQgaW4gcHJldmlvdXMKPiByZXZpc2lvbnMuIE5leHQgdGltZSwgSSB3
aWxsIG5vdCB0YWtlIHRoZSBwYXRjaCBpZiBwcmV2aW91cyB0YWdzIGFyZQo+IG1pc3NpbmcuCgpT
b3JyeSBhYm91dCB0aGF0LiBJIHRob3VnaHQgdGhlIFJldmlld2VkLWJ5IGFuZCBBY2tlZC1ieSB0
YWdzIGJlbG9uZwp0byB0aGUgcHJldmlvdXMgdmVyc2lvbiBzbyBkaWRuJ3QgY2FycnkgdGhlbS4K
Cj4KPiBRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNi4yMC4KCkRvIEkgc3RpbGwgbmVlZCB0
byByZXNlbmQgdGhlIHBhdGNoIHdpdGggUmV2aWV3ZWQtYnkgYW5kIEFja2VkLWJ5IHRhZ3M/CgpC
ZXN0IHJlZ2FyZHMsClh1IEx1Cgo+Cj4gUmVnYXJkcywKPiBBbnVwCj4KPiA+IC0tLQo+ID4gIGFy
Y2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAgZHJpdmVy
cy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jIHwgMTIgKysrKysrKysrKystCj4gPiAg
aW5jbHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmggICAgIHwgIDMgKysrCj4gPiAgMyBm
aWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWEuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYS5jCj4g
PiBpbmRleCBkYWQzMTgxODU2NjAwLi5jYWMzYzJiNTFkNzI0IDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9yaXNjdi9rdm0vYWlhLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYS5jCj4gPiBAQCAt
NjMwLDcgKzYzMCw3IEBAIGludCBrdm1fcmlzY3ZfYWlhX2luaXQodm9pZCkKPiA+ICAgICAgICAg
ICovCj4gPiAgICAgICAgIGlmIChnYykKPiA+ICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfYWlh
X25yX2hnZWkgPSBtaW4oKHVsb25nKWt2bV9yaXNjdl9haWFfbnJfaGdlaSwKPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKGdjLT5ndWVzdF9pbmRleF9i
aXRzKSAtIDEpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBnYy0+bnJfZ3Vlc3RfZmlsZXMpOwo+ID4gICAgICAgICBlbHNlCj4gPiAgICAgICAgICAgICAg
ICAga3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpID0gMDsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1pbXNpYy1zdGF0ZS5jCj4gPiBpbmRleCBkYzk1YWQ4NTZkODBhLi5lOGYyMGVmYjAyOGJl
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5j
Cj4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiA+IEBA
IC03OTQsNyArNzk0LDcgQEAgc3RhdGljIGludCBfX2luaXQgaW1zaWNfcGFyc2VfZndub2RlKHN0
cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsCj4gPgo+ID4gIGludCBfX2luaXQgaW1zaWNfc2V0
dXBfc3RhdGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwgdm9pZCAqb3BhcXVlKQo+ID4g
IHsKPiA+IC0gICAgICAgdTMyIGksIGosIGluZGV4LCBucl9wYXJlbnRfaXJxcywgbnJfbW1pb3Ms
IG5yX2hhbmRsZXJzID0gMDsKPiA+ICsgICAgICAgdTMyIGksIGosIGluZGV4LCBucl9wYXJlbnRf
aXJxcywgbnJfbW1pb3MsIG5yX2d1ZXN0X2ZpbGVzLCBucl9oYW5kbGVycyA9IDA7Cj4gPiAgICAg
ICAgIHN0cnVjdCBpbXNpY19nbG9iYWxfY29uZmlnICpnbG9iYWw7Cj4gPiAgICAgICAgIHN0cnVj
dCBpbXNpY19sb2NhbF9jb25maWcgKmxvY2FsOwo+ID4gICAgICAgICB2b2lkIF9faW9tZW0gKipt
bWlvc192YSA9IE5VTEw7Cj4gPiBAQCAtODg4LDYgKzg4OCw3IEBAIGludCBfX2luaXQgaW1zaWNf
c2V0dXBfc3RhdGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwgdm9pZCAqb3BhcXVlKQo+
ID4gICAgICAgICB9Cj4gPgo+ID4gICAgICAgICAvKiBDb25maWd1cmUgaGFuZGxlcnMgZm9yIHRh
cmdldCBDUFVzICovCj4gPiArICAgICAgIGdsb2JhbC0+bnJfZ3Vlc3RfZmlsZXMgPSBCSVQoZ2xv
YmFsLT5ndWVzdF9pbmRleF9iaXRzKSAtIDE7Cj4gPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBu
cl9wYXJlbnRfaXJxczsgaSsrKSB7Cj4gPiAgICAgICAgICAgICAgICAgcmMgPSBpbXNpY19nZXRf
cGFyZW50X2hhcnRpZChmd25vZGUsIGksICZoYXJ0aWQpOwo+ID4gICAgICAgICAgICAgICAgIGlm
IChyYykgewo+ID4gQEAgLTkyOCw2ICs5MjksMTUgQEAgaW50IF9faW5pdCBpbXNpY19zZXR1cF9z
dGF0ZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLCB2b2lkICpvcGFxdWUpCj4gPiAgICAg
ICAgICAgICAgICAgbG9jYWwtPm1zaV9wYSA9IG1taW9zW2luZGV4XS5zdGFydCArIHJlbG9mZjsK
PiA+ICAgICAgICAgICAgICAgICBsb2NhbC0+bXNpX3ZhID0gbW1pb3NfdmFbaW5kZXhdICsgcmVs
b2ZmOwo+ID4KPiA+ICsgICAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAgICAqIEtW
TSB1c2VzIGdsb2JhbC0+bnJfZ3Vlc3RfZmlsZXMgdG8gZGV0ZXJtaW5lIHRoZSBhdmFpbGFibGUg
Z3Vlc3QKPiA+ICsgICAgICAgICAgICAgICAgKiBpbnRlcnJ1cHQgZmlsZXMgb24gZWFjaCBDUFUu
IFRha2UgdGhlIG1pbmltdW0gbnVtYmVyIG9mIGd1ZXN0Cj4gPiArICAgICAgICAgICAgICAgICog
aW50ZXJydXB0IGZpbGVzIGFjcm9zcyBhbGwgQ1BVcyB0byBhdm9pZCBLVk0gaW5jb3JyZWN0bHkg
YWxsb2NhdGluZwo+ID4gKyAgICAgICAgICAgICAgICAqIGFuIHVuZXhpc3RlZCBvciB1bm1hcHBl
ZCBndWVzdCBpbnRlcnJ1cHQgZmlsZSBvbiBzb21lIENQVXMuCj4gPiArICAgICAgICAgICAgICAg
ICovCj4gPiArICAgICAgICAgICAgICAgbnJfZ3Vlc3RfZmlsZXMgPSAocmVzb3VyY2Vfc2l6ZSgm
bW1pb3NbaW5kZXhdKSAtIHJlbG9mZikgLyBJTVNJQ19NTUlPX1BBR0VfU1ogLSAxOwo+ID4gKyAg
ICAgICAgICAgICAgIGdsb2JhbC0+bnJfZ3Vlc3RfZmlsZXMgPSBtaW4oZ2xvYmFsLT5ucl9ndWVz
dF9maWxlcywgbnJfZ3Vlc3RfZmlsZXMpOwo+ID4gKwo+ID4gICAgICAgICAgICAgICAgIG5yX2hh
bmRsZXJzKys7Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmggYi9pbmNsdWRlL2xpbnV4L2lycWNoaXAvcmlzY3YtaW1z
aWMuaAo+ID4gaW5kZXggNzQ5NDk1MmM1NTE4Ny4uNDNhZWQ1MjM4NTAwOCAxMDA2NDQKPiA+IC0t
LSBhL2luY2x1ZGUvbGludXgvaXJxY2hpcC9yaXNjdi1pbXNpYy5oCj4gPiArKysgYi9pbmNsdWRl
L2xpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaAo+ID4gQEAgLTY5LDYgKzY5LDkgQEAgc3RydWN0
IGltc2ljX2dsb2JhbF9jb25maWcgewo+ID4gICAgICAgICAvKiBOdW1iZXIgb2YgZ3Vlc3QgaW50
ZXJydXB0IGlkZW50aXRpZXMgKi8KPiA+ICAgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG5yX2d1ZXN0X2lkczsKPiA+Cj4gPiArICAgICAgIC8qIE51bWJlciBv
ZiBndWVzdCBpbnRlcnJ1cHQgZmlsZXMgcGVyIGNvcmUgKi8KPiA+ICsgICAgICAgdTMyICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5yX2d1ZXN0X2ZpbGVzOwo+ID4gKwo+ID4g
ICAgICAgICAvKiBQZXItQ1BVIElNU0lDIGFkZHJlc3NlcyAqLwo+ID4gICAgICAgICBzdHJ1Y3Qg
aW1zaWNfbG9jYWxfY29uZmlnIF9fcGVyY3B1ICAgICAgKmxvY2FsOwo+ID4gIH07Cj4gPiAtLQo+
ID4gMi4yMC4xCj4gPgo+ID4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8va3ZtLXJpc2N2Cg==
