Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B3BC54F51
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 13:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVxkQvjh9dOX5wwyYLlyRj2oddVK/L5FEm75sNVD87M=; b=o45K7iYjRf975t
	ABcEj1M1AlM5ynHXJnTZVrgvUoLVedK9NxMvQDl+IwcULork2gjKBMvhJdM++1yPxiTO21ReV7ms2
	0OuTXCJ2s6GXgOdenH8GYSk7ut2u8AuPD+3EkpGHt6gVuNQuX1nnndoHRbDADFaVuaKE1WEpttED7
	G3+KS3fI568Lmlixc9/XeE1QsZEONqUXqmscVBJBvRhaSL6eEVjBuTC/4C7oMnyWgGxxXdEsHCLS9
	1wFM4jDYnrS/S1o5bjhb5IwAJUloPxMADnkLKk3B1X+S69EqpWoiRey77g+fHkcOq+YRObrjg3nD8
	gLxTyr1lno7aTSK80ZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3vw-000000080Bf-1Mhq;
	Wed, 29 Jul 2026 13:02:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3vt-000000080Av-2eQY
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 13:02:51 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso827978f8f.3
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 06:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785330167; cv=none;
        d=google.com; s=arc-20260327;
        b=ZUOuimwXICY0jYpzKaIgbdvM+Tc/2kC9QUsuULhdg0I7bdhljpO4xkLDQe4aZDcE5C
         JZG05xb0vFqBsilVxfoo5DhEfsk8XgK6LWzUPOD0pl0wo+MB7X8axttlB3J792zmBb/y
         Xr9tFWIBAM7/vfzTboCEpaxPHJQK9n/ujOabqUN+7WyY4Pz73Lg5MkkFN7EQoWX3UK1e
         psXrS/GgX0dS0WyejyV4U8zqgXViBOZVNvNqqT4CzG/EOqbtqxoummY4IHSEBMtPLCk5
         4BVDzvr4Ph1j3ZJbEp3QrcIeVsriQIzOU33BRCPoKpskW/Ju3GiGZs//KmnCF3ybcEV3
         ookw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xwG4KZ8DundkT4/gQU792HRUkxOVMwanRijYp1dPzBA=;
        fh=HHad/r+M0K/oO29lTAQWJ05XTjGM09jyfPghQY+vFPo=;
        b=HEl4fOFKKeZ8QJFl5GdWpRbGQxtRKxDhnUwGDnWZMcFJh9Va/rafouY3ZNhfFguGxm
         N9UTcp6G9bPcuUVtbZrsn1DtcSGpSqy+TAvCFKnkhL84NvTLZGJSDEABv8c356ObB+j/
         Mj9h6m8siaXlk0kkfcTsVeWlWbnbeGEAzeBIfIlV4s+zEjhSGjpM6wFk37eJ/3zHJ2zj
         zO1nMjPyr/wgmfoejR6ry0Lcxw0celgCGFYdv7fTMiPiuL60wVS2qsc7el6ECNVAgEiZ
         0vFXkM1MIqu1K0wyHZ39DxjIzAkzVYWYEKudw7SxiFEungjlBkmkwqURznXsWl2Hgms8
         fN1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785330167; x=1785934967; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xwG4KZ8DundkT4/gQU792HRUkxOVMwanRijYp1dPzBA=;
        b=jgiheH/HIBpRUR2Yl2vzDiTAZ6Q7iq2z9zVTd1zngUIu9zvVr6eGEgVd71pfwJlKi7
         wXc5i3QoYjRKkZ+9KnaGmiw7Zeq9Cz3ZtbHWCW+eJSB+NW1D03CoNZsECLCtPuXEOEP5
         93C4XzLKw4xz7lc7yLjyOHt3YU+zhS4QPTWAa7ITYkjpHsOAvL9JmwOlz9cozmozYqo9
         ePlkCRNxrTLO4i5XKeKRYN96N/QGxcC7hjVDRXkSB23bnfiOYE13jKMttE2PJ0gmfEy7
         3QjtG8czYh33V6TGz6U0mPkDhIzSqSSl1Wl3xwYySlHXsP/dnmBdRhyWh3hgdvBxq0iB
         726Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330167; x=1785934967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwG4KZ8DundkT4/gQU792HRUkxOVMwanRijYp1dPzBA=;
        b=WcQpufZnrLM0MFfe9hxLpcvbqHUMBEBx+oG5aZXKSBdt9skXvhBfGXshJwyFX8B6ji
         e9Ayx+vyFFS3NdWuYwvaV/mlV7P9+f2QPFBUebw59kpIT9s0DWTUIEiiAam5dtPvg34Z
         orFaXRDjEo7iX70vdWZl3H9hs2PsPQfR3afCLiXBVnsmvm17qwjepjE7AQSqpWrvzOby
         0EWgBUKMY0YY/Yygs70Ju+TMS3NOxFaSvHOGhvuY3JJ8ZyMQFjBNKa3iEuvnpjwZtbKP
         7WuhE1dXLuBMM33QuTPwJLGU9lMhgZbet/52zlIRmEHpvOK9s9VJGv6/HQHh3OC63tTq
         LFhA==
X-Forwarded-Encrypted: i=1; AHgh+RoDEQWT8IzD1dEVvLYXQ76TyXd4Kwe9hs9gzynnFNVjZ9XuA+w8sxJ9pWrMbDB8/niwHZ77c/2/1Bw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy63BHGWtqssrDPnuemvlvYx9kYSHFl3XbABKtDFIo6jlQKBjSi
	ytT34qmN7zE3yYUBTwFd6Ojhf07A5VyBXJfdfXqtdDC1UCRESfmotXJnXxeWs7TyThWtP+g55a/
	/XuvXHEDbmohwpnZYVr1AhMdrrp1cK7ldNMqewIUqLQ==
X-Gm-Gg: AR+sD10UMoNrVQ/mxns2PRSNeXXvSmnSci8k5n+8VRBYmWpHIdOJW60jQHSozDqKRSr
	XbQbsPWW/4ZRL14rpxfRqvjIhojOHniYyedHzfGey1VbDNYuIHnz9TGxRkRrhOQnIOhFxMJOX3p
	uTmuO5XQKxx9oKv2UD7ZxHGr9BKBx4Ay7SDxBD4pKG8+BFLiVwnHKKgqPkvDVhfNpTZQYXI0VYl
	czREIq+HyPKsba4JWae5CUf8ABrJgeie/1d+hdaahyumK+PSILE88srKt+5KvrrZt28/oY0zgm/
	dMXHwCDc8kQQtwPwBggMWdkgbO4vShunh2wskltEcFxyIqMO5TStef02mXHMTou27SjQYSx8nF5
	iHy1OZY5SSk1yCTYP2+0mQfwzsJMOUV/OVbsa+NLcFpb3G5O/NUid6M21s45tqrA=
X-Received: by 2002:a05:6000:2905:b0:47f:87f5:ed32 with SMTP id
 ffacd0b85a97d-47fb1f1ee67mr8269589f8f.46.1785330167110; Wed, 29 Jul 2026
 06:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-6-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-6-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:32:35 +0530
X-Gm-Features: AUfX_mwE8ZwJxVamoxay-s7b9HbXLhua7tMXOSg40tFpb0mLvfWDnTva0izJLrg
Message-ID: <CAAhSdy2Eg3H73At808Bq8yXv64j+nowRXzHZfMBsC=MDke7Bzg@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] RISC-V: KVM: Handle software-check exits for VCPU
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_060249_689356_49D2D859 
X-CRM114-Status: GOOD (  15.30  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgNjozNOKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlIGV4dGVuc2lvbiBaaWNmaXNzL1ppY2ZpbHAgaW50
cm9kdWNlcyBhIHNvZnR3YXJlLWNoZWNrIGV4Y2VwdGlvbgo+IHRvIHRoZSBwcml2aWxlZ2UgYXJj
aGl0ZWN0dXJlLiBEZWxlZ2F0ZSB0aGlzIGV4Y2VwdGlvbiB0byBWUyBtb2RlCj4gd2hlbiB2Q1BV
IGVuYWJsZSBaaWNmaXNzL1ppY2ZpbHAgc28gdGhlIENGSSB2aW9sYXRpb25zIGluIFZVL1ZTIGNv
dWxkCj4gYmUgcmVwb3J0ZWQuCgpUaGUgcGF0Y2g2IG11c3QgYmUgc3F1YXNoZWQgaW50byB0aGlz
IHBhdGNoLgoKUmVnYXJkcywKQW51cAoKPgo+IEFzc2lzdGVkLWJ5OiBZdWFuU2hlbmc6Y2xhdWRl
LTQuNy1vcHVzCj4gQ28tZGV2ZWxvcGVkLWJ5OiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFj
LmNuPgo+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4g
U2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KPiAtLS0K
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92
Y3B1X2V4aXQuYyAgIHwgNCArKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3NyLmgKPiBpbmRleCAzMWI4OTg4ZjQ0ODguLjIyNGFmOWZhY2YxZiAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+IEBAIC0xMTcsNiArMTE3LDcgQEAKPiAgI2RlZmluZSBF
WENfSU5TVF9QQUdFX0ZBVUxUICAgIDEyCj4gICNkZWZpbmUgRVhDX0xPQURfUEFHRV9GQVVMVCAg
ICAxMwo+ICAjZGVmaW5lIEVYQ19TVE9SRV9QQUdFX0ZBVUxUICAgMTUKPiArI2RlZmluZSBFWENf
U09GVFdBUkVfQ0hFQ0sgICAgICAgICAgICAgMTgKPiAgI2RlZmluZSBFWENfSU5TVF9HVUVTVF9Q
QUdFX0ZBVUxUICAgICAgMjAKPiAgI2RlZmluZSBFWENfTE9BRF9HVUVTVF9QQUdFX0ZBVUxUICAg
ICAgMjEKPiAgI2RlZmluZSBFWENfVklSVFVBTF9JTlNUX0ZBVUxUICAgICAgICAgMjIKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
X2V4aXQuYwo+IGluZGV4IDBiYjBjNTFlM2M4OS4uMTJlZWJlYWJkZjE0IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9l
eGl0LmMKPiBAQCAtMjQzLDYgKzI0MywxMCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfZXhpdChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4sCj4gICAgICAgICAgICAgICAg
IHJ1bi0+ZXhpdF9yZWFzb24gPSBLVk1fRVhJVF9ERUJVRzsKPiAgICAgICAgICAgICAgICAgcmV0
ID0gMDsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBjYXNlIEVYQ19TT0ZUV0FS
RV9DSEVDSzoKPiArICAgICAgICAgICAgICAgaWYgKHZjcHUtPmFyY2guY2ZnLmhlbnZjZmcgJiAo
RU5WQ0ZHX0xQRSB8IEVOVkNGR19TU0UpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9
IHZjcHVfcmVkaXJlY3QodmNwdSwgdHJhcCk7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICAg
ICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICB9Cj4gLS0K
PiAyLjU1LjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9r
dm0tcmlzY3YK
