Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A010CCD8C88
	for <kvm-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 05:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDUA4kd4FZq7Kr/uhhmG+sW9WxBU52veJGf6VqrqCkg=; b=zSUi38vq7+VeVJ
	nQDq4pqy7F7mCz+tCn3gxnhz09b3uERjGs8LQ7tz8a1EOxivt5iP5EQa/6zgPkX5Eip9odw7ekoDo
	bPyScuJU8M/eM3xTyZcdkS2iLJVA3va/sZmWe38PjjEkC0wjh0T4pnPKJrAyXqijzcEQpCBUU6DGb
	as1NQH0dhSGN0iwNcQ3aYUzRSVk7lpj1wyOEXEXA7Tt37qFq71hIy2EcsZXGQ0FvmRCmShw2ZT+EM
	4HFoJZ0o0kJG8ZxiVqqnzK+co9y2trM+zT7nyp+RpEEI8IDp3abW9mUxqHr3Ca9W2U0lpmv6jkWsu
	7XAYP82IcoPX0vGTMb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW6Nl-0000000230Q-2gpr;
	Sun, 07 Jun 2026 05:49:13 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW6Ni-000000022zX-2oKe
	for kvm-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 05:49:12 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3965d76090bso29413691fa.2
        for <kvm-riscv@lists.infradead.org>; Sat, 06 Jun 2026 22:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780811347; cv=none;
        d=google.com; s=arc-20240605;
        b=aPXMsUBCmRYOQK9rdXiLCpwcL4kLtzx35Q1M/vQb66ebIte8bMGmIZt2P/zVStHJHb
         PA1IY+v27wiuZrQHcE5Fgh9ni48x0RDdDyJCXfXvcKjCn5mn1jl5l2yc9WJAE4gaWmdx
         ziYTnmU0O/B3N0QkVxZb3M9QABdoN61oNz+TLyO3Vj3V49QU5PkJzNb6nf7Yvpq3ZR+Z
         VhOH4bTHGL0bxNTunUuHO3h+BP0TIBsTvw6KMP1lMCGz5VVycFbjplkZRnRCR92rAasq
         ijauuWWcAOOahVGYMrzublmst7sKvwfiF2q7LyA2Hz8E0l/lCrf6bYn6fCHs8dKaWLRu
         in5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NDGuX9OEdV0WxJZIy7dMh7D8y98iOZJkmyFqpGy0K+s=;
        fh=3NgEtAncQ+AdBxZAG5tCWNS3i13vbM1EsGjTNsQqOXw=;
        b=aPVllmtKWW35N2TvjIzTvPYGRAcSPO/+PWCQJwnwyDoX5QLqy6VcHL1SCoYp053Bmm
         hGqX+sKXSW7TwIA4/hawNmWA4thoUQUfWPk9ZTmKQF0cUiGApFELKlqvDmevM8TL888x
         mqn4ph8f/fl2HJ8qhF+o8Bh6eOnVjx3/uAsyzYpscjNt+EfuLvQ1DhZJ6IJOdH1euy/n
         9QP4Q7dDmq9Kxy5+viNECbsdHg6w0uZSRs1uVjkyVrNhkIu48tQYUPOcbo0cR8HxwKgi
         TAcJirGss7R2ELV9mGtysEkrv+UJglaLrE5RFq7WBCHAlGMkibJkqGoSI0P5j+ZvdwU/
         Um/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1780811347; x=1781416147; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDGuX9OEdV0WxJZIy7dMh7D8y98iOZJkmyFqpGy0K+s=;
        b=NyC9cp6CzuMHvvgkXZ+kz5OXqIdx+Zr1zvyi5WmaOWD5IYJJQOC6Y2QfoOHtKXGOck
         giaDbPGDexpORVw/mqQoTPw8b6YLuwVOhgnfAAgCppOj01YTBpbb/5Nmo6avUiXC1hwg
         ww2o5IUytrd6XZSrx2LhKW8B7R3mcnRFpJbdkGMZijOvLV7TGtd5tCER2B0FpsPxZlB3
         g2m8J+biAVkIiYfPkvzMSgsw/kP1FJLTOsHxXTYV7O6JU6EZIPsWwhrROh+L8fIT4d5L
         QgL1o+MtiC/V5jxEoCD2ai5GiTvyZQ0QFvy8hpnBjxdyfYIOCbznksj/RceF0uwLj1qK
         OxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780811347; x=1781416147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NDGuX9OEdV0WxJZIy7dMh7D8y98iOZJkmyFqpGy0K+s=;
        b=LBhssuEygvCxLSVvKwF4qllEa38EjLGViJHVJwlYB9cWuI696plnXW8dQlJg8t2OSg
         8XvLNQT8R/zeoqHqrBunSfDJXECqv/Vo9DKPp1c8wqickWPrfIT0tjs15qletnyBLq5n
         F+VoMlV/AeWbzNuwKIyaQq+O7lXv+rq97RX2ejchBHqLWsZ/tKAngKf8Uf8hCFYePM81
         pNbHvMPU3u2f5vyuZ7+hSzBDXxR99RQFJe1W/LUa4Pa9cdGQMjnLutIfRThCUWV+UwAg
         6Uacv+E69EGMI0SGGIgsmJukfmzEXjf35yLZ4LQhWcqnlOxstPfdDJ//2e6dSAlNVZ1y
         ZM2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8r36Pti8X1b6mdwpjFAOCA9atUu9EnqqGPdbmIh28OKzrK3go0GfpyaSLHe2KihOex8fQHoe392Wk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHU02RY7g02XplliJGEZVnrbD+qsrCf/V9QfVnZTwcsXKN4wJx
	HIjSb5aRTax2N+/No3A/FZEjBE/NhFTJa4YXKr+Sa4ck/S21kjAQXn6KXvcl37ISh1KQBh/ygTq
	Pdk0YCyS8RPgRXueiNrYZxmCgpWx56vHUc/Ciyi8WZA==
X-Gm-Gg: Acq92OFjJ5rwj+2SYa7Wg2+3bsEeafpwED95jo2HpOpMOdMHckmjnCxiA73exgTpKzz
	DIk189/GkzJUOJ6S1+fEc88igQS6Pt1Lg+7ZeLysYfzZE7+/vm0n5lVpIBXHYf06hCdyP1dbFcV
	YfohfHr1YIbU3cbLvgnVOpAmrWwC1IeLD6qPwYuqeuxcnkZfIyfJ2qcTg3fwcM6hjfuRe/0MhC2
	PtNZr/PxqLIvWr0dp8tReixgwEerDvG+heVYC5G23O3/zpCrPeg1dZ64vFHsgOBIeEaaDarhNIj
	7bJPRRd8u5n63F+hMt5hSyNo685Ew6HH4XnLKRFDRdGv7H8m7HfA
X-Received: by 2002:a05:6512:3f07:b0:5aa:6b19:b357 with SMTP id
 2adb3069b0e04-5aa87b8a247mr3429733e87.3.1780811346628; Sat, 06 Jun 2026
 22:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260604142602.3582602-1-tjytimi@163.com> <20260604142602.3582602-2-tjytimi@163.com>
In-Reply-To: <20260604142602.3582602-2-tjytimi@163.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 7 Jun 2026 11:18:55 +0530
X-Gm-Features: AVVi8CfHf4TZOApnOTYpsrfb2YZXExiqoE3V-jWe65JblzsSS9KztXhZX9w1KXI
Message-ID: <CAK9=C2XGRgz+3c2Rf8bj8tPtAiCpHXrsm2sNC1b7qHt-5p6PZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: riscv: Check hugetlb block mappings against
 memslot bounds
To: Jinyu Tang <tjytimi@163.com>
Cc: Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_224910_780401_C2107B5E 
X-CRM114-Status: GOOD (  33.80  )
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

T24gVGh1LCBKdW4gNCwgMjAyNiBhdCA3OjU44oCvUE0gSmlueXUgVGFuZyA8dGp5dGltaUAxNjMu
Y29tPiB3cm90ZToKPgo+IFJJU0MtViBLVk0gaGFzIHVzZWQgdGhlIGh1Z2V0bGIgVk1BIHNpemUg
ZGlyZWN0bHkgYXMgdGhlIEctc3RhZ2UKPiBtYXBwaW5nIHNpemUgc2luY2Ugc3RhZ2UtMiBwYWdl
IHRhYmxlIHN1cHBvcnQgd2FzIGFkZGVkLiBUaGF0IGlzIHNhZmUKPiBvbmx5IGlmIHRoZSBibG9j
ayBjb3ZlcmVkIGJ5IHRoZSBmYXVsdCBpcyBmdWxseSBjb250YWluZWQgaW4gdGhlCj4gbWVtc2xv
dCBhbmQgdGhlIHVzZXJzcGFjZSBhZGRyZXNzIGhhcyB0aGUgc2FtZSBvZmZzZXQgYXMgdGhlIEdQ
QQo+IHdpdGhpbiB0aGF0IGJsb2NrLgo+Cj4gVGhlIFRIUCBwYXRoIGFscmVhZHkgY2hlY2tzIHRo
b3NlIGNvbnN0cmFpbnRzIGJlZm9yZSBpbnN0YWxsaW5nIGEgUE1ECj4gYmxvY2sgbWFwcGluZy4g
VGhlIGh1Z2V0bGIgcGF0aCBkaWQgbm90LCBzbyBhbiB1bmFsaWduZWQgbWVtc2xvdCBjb3VsZAo+
IG1ha2UgS1ZNIGluc3RhbGwgYSBQTUQgb3IgUFVEIHNpemVkIEctc3RhZ2UgYmxvY2sgdGhhdCBj
b3ZlcnMgbWVtb3J5Cj4gb3V0c2lkZSB0aGUgc2xvdCBvciBtYXBzIHRoZSB3cm9uZyBob3N0IHBh
Z2VzLgo+Cj4gUGFzcyB0aGUgdGFyZ2V0IG1hcHBpbmcgc2l6ZSBpbnRvIGZhdWx0X3N1cHBvcnRz
X2dzdGFnZV9odWdlX21hcHBpbmcoKS4KPiBUaGUgc2FtZSBoZWxwZXIgY2FuIGJlIHVzZWQgZm9y
IGJvdGggVEhQIFBNRCBtYXBwaW5ncyBhbmQgaHVnZXRsYgo+IFBNRC9QVUQgbWFwcGluZ3MuCj4K
PiBTZWxlY3QgaHVnZXRsYiBtYXBwaW5nIHNpemVzIHRocm91Z2ggdGhlIHNhbWUgbWVtc2xvdC1i
b3VuZGFyeSBjaGVjaywKPiBmYWxsaW5nIGJhY2sgZnJvbSBQVUQgdG8gUE1EIHRvIFBBR0VfU0la
RS4gV2hlbiBhIHNtYWxsZXIgaHVnZXRsYgo+IG1hcHBpbmcgc2l6ZSBpcyBzZWxlY3RlZCwgZmF1
bHQgdGhlIEdGTiBhbGlnbmVkIHRvIHRoYXQgc2VsZWN0ZWQgc2l6ZQo+IGluc3RlYWQgb2YgdGhl
IG9yaWdpbmFsIFZNQSBzaXplLgo+Cj4gQWxzbyBrZWVwIGh1Z2V0bGIgbWFwcGluZ3Mgb3V0IG9m
IHRyYW5zcGFyZW50X2h1Z2VwYWdlX2FkanVzdCgpLiBPbmNlCj4gdGhlIGh1Z2V0bGIgcGF0aCBo
YXMgY2hvc2VuIFBBR0VfU0laRSwgcHJvbW90aW5nIGl0IGFnYWluIHRocm91Z2ggdGhlCj4gVEhQ
IGhlbHBlciB3b3VsZCBtaXNzIHRoZSBodWdldGxiIGZhbGxiYWNrIGRlY2lzaW9uLgo+Cj4gRml4
ZXM6IDlkMDVjMWZlZTgzNyAoIlJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgc3RhZ2UyIHBhZ2UgdGFi
bGUgcHJvZ3JhbW1pbmciKQo+IFNpZ25lZC1vZmYtYnk6IEppbnl1IFRhbmcgPHRqeXRpbWlAMTYz
LmNvbT4KPiBSZXZpZXdlZC1ieTogTnV0dHkgTGl1IDxudXR0eS5saXVAaG90bWFpbC5jb20+CgpM
R1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cgo+IC0t
LQo+IHYxIC0+IHYyOgo+ICAgLSBTcXVhc2ggdGhlIGhlbHBlciBwYXJhbWV0ZXJpemF0aW9uIGlu
dG8gdGhpcyBodWdldGxiIGZpeC4KPiAgIC0gVXNlIHRoZSBBTElHTigpL0FMSUdOX0RPV04oKSBm
b3JtIHN1Z2dlc3RlZCBieSBOdXR0eSBMaXUgYW5kIEFudXAKPiAgICAgZm9yIHRoZSBtZW1zbG90
IGJvdW5kYXJ5IGNoZWNrLgo+Cj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jIHwgNTQgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ0
IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL21tdS5jIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCAyZDNkZWYwMjQuLjBh
ZGYwMTdhMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBiL2FyY2gv
cmlzY3Yva3ZtL21tdS5jCj4gQEAgLTI4Niw3ICsyODYsOCBAQCBib29sIGt2bV90ZXN0X2FnZV9n
Zm4oc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSAqcmFuZ2UpCj4gIH0KPgo+
ICBzdGF0aWMgYm9vbCBmYXVsdF9zdXBwb3J0c19nc3RhZ2VfaHVnZV9tYXBwaW5nKHN0cnVjdCBr
dm1fbWVtb3J5X3Nsb3QgKm1lbXNsb3QsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGh2YSkKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaHZhLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBtYXBf
c2l6ZSkKPiAgewo+ICAgICAgICAgaHZhX3QgdWFkZHJfc3RhcnQsIHVhZGRyX2VuZDsKPiAgICAg
ICAgIGdwYV90IGdwYV9zdGFydDsKPiBAQCAtMzAwLDggKzMwMSw4IEBAIHN0YXRpYyBib29sIGZh
dWx0X3N1cHBvcnRzX2dzdGFnZV9odWdlX21hcHBpbmcoc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAq
bWVtc2xvdCwKPgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIFBhZ2VzIGJlbG9uZ2luZyB0byBt
ZW1zbG90cyB0aGF0IGRvbid0IGhhdmUgdGhlIHNhbWUgYWxpZ25tZW50Cj4gLSAgICAgICAgKiB3
aXRoaW4gYSBQTUQgZm9yIHVzZXJzcGFjZSBhbmQgR1BBIGNhbm5vdCBiZSBtYXBwZWQgd2l0aCBn
LXN0YWdlCj4gLSAgICAgICAgKiBQTUQgZW50cmllcywgYmVjYXVzZSB3ZSdsbCBlbmQgdXAgbWFw
cGluZyB0aGUgd3JvbmcgcGFnZXMuCj4gKyAgICAgICAgKiB3aXRoaW4gYSBodWdlIHBhZ2UgZm9y
IHVzZXJzcGFjZSBhbmQgR1BBIGNhbm5vdCBiZSBtYXBwZWQgd2l0aAo+ICsgICAgICAgICogZy1z
dGFnZSBibG9jayBlbnRyaWVzLCBiZWNhdXNlIHdlJ2xsIGVuZCB1cCBtYXBwaW5nIHRoZSB3cm9u
ZyBwYWdlcy4KPiAgICAgICAgICAqCj4gICAgICAgICAgKiBDb25zaWRlciBhIGxheW91dCBsaWtl
IHRoZSBmb2xsb3dpbmc6Cj4gICAgICAgICAgKgo+IEBAIC0zMjEsNyArMzIyLDcgQEAgc3RhdGlj
IGJvb2wgZmF1bHRfc3VwcG9ydHNfZ3N0YWdlX2h1Z2VfbWFwcGluZyhzdHJ1Y3Qga3ZtX21lbW9y
eV9zbG90ICptZW1zbG90LAo+ICAgICAgICAgICogICBlIC0+IGcKPiAgICAgICAgICAqICAgZiAt
PiBoCj4gICAgICAgICAgKi8KPiAtICAgICAgIGlmICgoZ3BhX3N0YXJ0ICYgKFBNRF9TSVpFIC0g
MSkpICE9ICh1YWRkcl9zdGFydCAmIChQTURfU0laRSAtIDEpKSkKPiArICAgICAgIGlmICgoZ3Bh
X3N0YXJ0ICYgKG1hcF9zaXplIC0gMSkpICE9ICh1YWRkcl9zdGFydCAmIChtYXBfc2l6ZSAtIDEp
KSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Cj4gICAgICAgICAvKgo+IEBAIC0z
MzYsNyArMzM3LDggQEAgc3RhdGljIGJvb2wgZmF1bHRfc3VwcG9ydHNfZ3N0YWdlX2h1Z2VfbWFw
cGluZyhzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICptZW1zbG90LAo+ICAgICAgICAgICogdXNlcnNw
YWNlX2FkZHIgb3IgdGhlIGJhc2VfZ2ZuLCBhcyBib3RoIGFyZSBlcXVhbGx5IGFsaWduZWQgKHBl
cgo+ICAgICAgICAgICogdGhlIGNoZWNrIGFib3ZlKSBhbmQgZXF1YWxseSBzaXplZC4KPiAgICAg
ICAgICAqLwo+IC0gICAgICAgcmV0dXJuIChodmEgPj0gQUxJR04odWFkZHJfc3RhcnQsIFBNRF9T
SVpFKSkgJiYgKGh2YSA8IEFMSUdOX0RPV04odWFkZHJfZW5kLCBQTURfU0laRSkpOwo+ICsgICAg
ICAgcmV0dXJuIChodmEgPj0gQUxJR04odWFkZHJfc3RhcnQsIG1hcF9zaXplKSkgJiYKPiArICAg
ICAgICAgICAgICAoaHZhIDwgQUxJR05fRE9XTih1YWRkcl9lbmQsIG1hcF9zaXplKSk7Cj4gIH0K
Pgo+ICBzdGF0aWMgaW50IGdldF9odmFfbWFwcGluZ19zaXplKHN0cnVjdCBrdm0gKmt2bSwKPiBA
QCAtNDA0LDcgKzQwNiw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHRyYW5zcGFyZW50X2h1Z2Vw
YWdlX2FkanVzdChzdHJ1Y3Qga3ZtICprdm0sCj4gICAgICAgICAgKiBzdXJlIHRoYXQgdGhlIEhW
QSBhbmQgR1BBIGFyZSBzdWZmaWNpZW50bHkgYWxpZ25lZCBhbmQgdGhhdCB0aGUKPiAgICAgICAg
ICAqIGJsb2NrIG1hcCBpcyBjb250YWluZWQgd2l0aGluIHRoZSBtZW1zbG90Lgo+ICAgICAgICAg
ICovCj4gLSAgICAgICBpZiAoZmF1bHRfc3VwcG9ydHNfZ3N0YWdlX2h1Z2VfbWFwcGluZyhtZW1z
bG90LCBodmEpKSB7Cj4gKyAgICAgICBpZiAoZmF1bHRfc3VwcG9ydHNfZ3N0YWdlX2h1Z2VfbWFw
cGluZyhtZW1zbG90LCBodmEsIFBNRF9TSVpFKSkgewo+ICAgICAgICAgICAgICAgICBpbnQgc3o7
Cj4KPiAgICAgICAgICAgICAgICAgc3ogPSBnZXRfaHZhX21hcHBpbmdfc2l6ZShrdm0sIGh2YSk7
Cj4gQEAgLTQyMSwxMiArNDIzLDMzIEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHRyYW5zcGFyZW50
X2h1Z2VwYWdlX2FkanVzdChzdHJ1Y3Qga3ZtICprdm0sCj4gICAgICAgICByZXR1cm4gUEFHRV9T
SVpFOwo+ICB9Cj4KPiArc3RhdGljIHVuc2lnbmVkIGxvbmcgaHVnZXRsYl9tYXBwaW5nX3NpemUo
c3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGh2YSwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG1hcF9zaXplKQo+ICt7Cj4g
KyAgICAgICBzd2l0Y2ggKG1hcF9zaXplKSB7Cj4gKyAgICAgICBjYXNlIFBVRF9TSVpFOgoKQXMg
cG9pbnRlZCBvdXQgYnkgc2FzaGlrby1ib3QsIHdlIG5lZWQgYSAiI2lmbmRlZiBDT05GSUdfMzJC
SVQiIG92ZXIgaGVyZS4KSSBoYXZlIHRha2VuIGNhcmUgYXQgdGhlIHRpbWUgb2YgbWVyZ2luZyB0
aGlzIHBhdGNoLgoKPiArICAgICAgICAgICAgICAgaWYgKGZhdWx0X3N1cHBvcnRzX2dzdGFnZV9o
dWdlX21hcHBpbmcobWVtc2xvdCwgaHZhLCBQVURfU0laRSkpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIFBVRF9TSVpFOwo+ICsgICAgICAgICAgICAgICBmYWxsdGhyb3VnaDsKPiAr
ICAgICAgIGNhc2UgUE1EX1NJWkU6Cj4gKyAgICAgICAgICAgICAgIGlmIChmYXVsdF9zdXBwb3J0
c19nc3RhZ2VfaHVnZV9tYXBwaW5nKG1lbXNsb3QsIGh2YSwgUE1EX1NJWkUpKQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiBQTURfU0laRTsKPiArICAgICAgICAgICAgICAgZmFsbHRo
cm91Z2g7Cj4gKyAgICAgICBjYXNlIFBBR0VfU0laRToKPiArICAgICAgICAgICAgICAgcmV0dXJu
IFBBR0VfU0laRTsKPiArICAgICAgIGRlZmF1bHQ6Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBt
YXBfc2l6ZTsKPiArICAgICAgIH0KPiArfQo+ICsKPiAgaW50IGt2bV9yaXNjdl9tbXVfbWFwKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgZ3BhX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGh2YSwgYm9vbCBp
c193cml0ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9nc3RhZ2VfbWFwcGlu
ZyAqb3V0X21hcCkKPiAgewo+ICAgICAgICAgaW50IHJldDsKPiAgICAgICAgIGt2bV9wZm5fdCBo
Zm47Cj4gKyAgICAgICBib29sIGlzX2h1Z2V0bGI7Cj4gICAgICAgICBib29sIHdyaXRhYmxlOwo+
ICAgICAgICAgc2hvcnQgdm1hX3BhZ2VzaGlmdDsKPiAgICAgICAgIGdmbl90IGdmbiA9IGdwYSA+
PiBQQUdFX1NISUZUOwo+IEBAIC00NjAsMTYgKzQ4MywyMyBAQCBpbnQga3ZtX3Jpc2N2X21tdV9t
YXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICptZW1zbG90
LAo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiAgICAgICAgIH0KPgo+IC0gICAg
ICAgaWYgKGlzX3ZtX2h1Z2V0bGJfcGFnZSh2bWEpKQo+ICsgICAgICAgaXNfaHVnZXRsYiA9IGlz
X3ZtX2h1Z2V0bGJfcGFnZSh2bWEpOwo+ICsgICAgICAgaWYgKGlzX2h1Z2V0bGIpCj4gICAgICAg
ICAgICAgICAgIHZtYV9wYWdlc2hpZnQgPSBodWdlX3BhZ2Vfc2hpZnQoaHN0YXRlX3ZtYSh2bWEp
KTsKPiAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgdm1hX3BhZ2VzaGlmdCA9IFBBR0Vf
U0hJRlQ7Cj4gICAgICAgICB2bWFfcGFnZXNpemUgPSAxVUxMIDw8IHZtYV9wYWdlc2hpZnQ7Cj4g
ICAgICAgICBpZiAobG9nZ2luZyB8fCAodm1hLT52bV9mbGFncyAmIFZNX1BGTk1BUCkpCj4gICAg
ICAgICAgICAgICAgIHZtYV9wYWdlc2l6ZSA9IFBBR0VfU0laRTsKPiArICAgICAgIGVsc2UgaWYg
KGlzX2h1Z2V0bGIpCj4gKyAgICAgICAgICAgICAgIHZtYV9wYWdlc2l6ZSA9IGh1Z2V0bGJfbWFw
cGluZ19zaXplKG1lbXNsb3QsIGh2YSwgdm1hX3BhZ2VzaXplKTsKPgo+ICsgICAgICAgLyoKPiAr
ICAgICAgICAqIEZvciBodWdldGxiIG1hcHBpbmdzLCB2bWFfcGFnZXNpemUgbWlnaHQgaGF2ZSBi
ZWVuIHJlZHVjZWQgZnJvbSB0aGUKPiArICAgICAgICAqIFZNQSBzaXplIHRvIGEgc21hbGxlciBz
YWZlIG1hcHBpbmcgc2l6ZS4KPiArICAgICAgICAqLwo+ICAgICAgICAgaWYgKHZtYV9wYWdlc2l6
ZSA9PSBQTURfU0laRSB8fCB2bWFfcGFnZXNpemUgPT0gUFVEX1NJWkUpCj4gLSAgICAgICAgICAg
ICAgIGdmbiA9IChncGEgJiBodWdlX3BhZ2VfbWFzayhoc3RhdGVfdm1hKHZtYSkpKSA+PiBQQUdF
X1NISUZUOwo+ICsgICAgICAgICAgICAgICBnZm4gPSBBTElHTl9ET1dOKGdwYSwgdm1hX3BhZ2Vz
aXplKSA+PiBQQUdFX1NISUZUOwo+Cj4gICAgICAgICAvKgo+ICAgICAgICAgICogUmVhZCBtbXVf
aW52YWxpZGF0ZV9zZXEgc28gdGhhdCBLVk0gY2FuIGRldGVjdCBpZiB0aGUgcmVzdWx0cyBvZgo+
IEBAIC01MTEsOCArNTQxLDEyIEBAIGludCBrdm1fcmlzY3ZfbW11X21hcChzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKm1lbXNsb3QsCj4gICAgICAgICBpZiAo
bW11X2ludmFsaWRhdGVfcmV0cnkoa3ZtLCBtbXVfc2VxKSkKPiAgICAgICAgICAgICAgICAgZ290
byBvdXRfdW5sb2NrOwo+Cj4gLSAgICAgICAvKiBDaGVjayBpZiB3ZSBhcmUgYmFja2VkIGJ5IGEg
VEhQIGFuZCB0aHVzIHVzZSBibG9jayBtYXBwaW5nIGlmIHBvc3NpYmxlICovCj4gLSAgICAgICBp
ZiAoIWxvZ2dpbmcgJiYgKHZtYV9wYWdlc2l6ZSA9PSBQQUdFX1NJWkUpKQo+ICsgICAgICAgLyoK
PiArICAgICAgICAqIENoZWNrIGlmIHdlIGFyZSBiYWNrZWQgYnkgYSBUSFAgYW5kIHRodXMgdXNl
IGJsb2NrIG1hcHBpbmcgaWYKPiArICAgICAgICAqIHBvc3NpYmxlLiBIdWdldGxiIG1hcHBpbmdz
IGFscmVhZHkgc2VsZWN0ZWQgdGhlaXIgdGFyZ2V0IHNpemUgYWJvdmUsCj4gKyAgICAgICAgKiBz
byBkbyBub3QgcHJvbW90ZSB0aGVtIHRocm91Z2ggdGhlIFRIUCBoZWxwZXIuCj4gKyAgICAgICAg
Ki8KPiArICAgICAgIGlmICghbG9nZ2luZyAmJiAhaXNfaHVnZXRsYiAmJiB2bWFfcGFnZXNpemUg
PT0gUEFHRV9TSVpFKQo+ICAgICAgICAgICAgICAgICB2bWFfcGFnZXNpemUgPSB0cmFuc3BhcmVu
dF9odWdlcGFnZV9hZGp1c3Qoa3ZtLCBtZW1zbG90LCBodmEsICZoZm4sICZncGEpOwo+Cj4gICAg
ICAgICBpZiAod3JpdGFibGUpIHsKPiAtLQo+IDIuNDMuMAo+CgpRdWV1ZWQgdGhpcyBwYXRjaCBm
b3IgTGludXgtNy4yCgpUaGFua3MsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
