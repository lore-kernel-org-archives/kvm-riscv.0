Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1FACA0FED
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 09:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aIyAziijhterj5t1JiH4XsE/nEfWbTCy4IZmy7ol5BA=; b=HGwEIDKolW9wKHJ/7G3qM7htKn
	huuTsKbTcqmeWQvAaMxinBzD0NROq3gehSFEpoxFtFfJcS37UtoImjXfbQIqsLR7oBvUJYmYlSuJK
	uMqDW5sVuBMdC+djQ6UGf89yeN0MsyPieb0vo6RyvDR8mjfSdrJj+PAhc+EARYDZtSP+9dyObCzKU
	jCva2KhkpwXF2aSS0fDgH0WRUrroQynQTUI1Uoa46FnqngyL05kDwtTQ5yfKK20qs+cnWPFGGK/no
	cbe2BK/0jd7DUF0NVxXjXwp3EuthPm7tDBkQr7ZSdmQxC1VOLUDeDv67xyGFQF7zmr897MDanoE1I
	enCsbppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuT9E-00000000sBB-1ncW;
	Fri, 05 Sep 2025 09:54:24 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRjD-00000000Kj6-2ihf
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 08:23:28 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-77288e1ce43so2020050b3a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Sep 2025 01:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757060606; x=1757665406; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJnhSI4zKDT3ImFhZhJBvG+6tvoITddVraqHrrqOWpc=;
        b=bo2bYEg0OX5SN5y5PV7eGQAF3OOwMia/AxB/0IYbYrI3jIIzfaLe/+q9RIQKkr9tgs
         IanxpyLLfLUl1VVMmGfRUpf9GO52sfd/udARaxTjXT6oBRiyETzf0dw2DpEef1HNF3MV
         Jjhr/R5PlZOdmRcD8GXaTNNZULQf+iJ/msxBoy34qQhlqVEbOfaLjBTXYoEjFCtc1/RV
         y5i0zCwsEKNwPXBHF1Ss60bvWCy5yfu6qkxVym1O1BeZ4w2lhiBNXGMAN83UKJsob5bc
         AqqPtlAOb4iTFDOUGYAIf6DE84LskgXhzjZFx5z4J9SZqedTiDWqf3W0gLNf+51fimO6
         MpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757060606; x=1757665406;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XJnhSI4zKDT3ImFhZhJBvG+6tvoITddVraqHrrqOWpc=;
        b=ShWCwQ+u26W+6lWWHDVp6WcerfA0fHGS+w4YzR1dbzhOeqwXxOFc+EZjJgomR6w+Sd
         352xAMJlWJ4DHaI5PSQMfM0ifBNZOfRIUfFbQHBiUvHKwC88Y33SmSgSOZ+SeOnEtuBw
         50WcWfNA+eS/I9gO4E06shDSDwEwJLfHV2btFwO/8Uf5a3OP37ezjm9xNGKcjAm2YuyY
         4QMsUtc4hJgVa0+pl9ZgMV41B0n/iVw+ebXFuO3L3Hj3d//kdO5CPjcf9Ox2REOzXOnp
         WfiaswcLwhhjssA1zoQVUd2VTHrCZgV8IjghANv83J7EG0dup/5CYl7dUPnxCevb9Jaf
         dpJg==
X-Forwarded-Encrypted: i=1; AJvYcCVAXRi9SiME1WeVFcD1Zne0DRy7WBCbUt2uUmKRkHEUfLQzNNszeeyuSSDOsgtzMlq8yYFW2/R/vvo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8kiJjNWS7wdtSbZHfb/u6m1egyMcVXSaBJXalbk55UvYzMgsH
	5BIR2TNM+Ce7AYHfALL0BPA9fFznToMYVT84HKnczLjtXZ5xNUTZSTBcAxyMYQYATs3XlQ/7/+f
	VxzqtZA==
X-Google-Smtp-Source: AGHT+IF349552GT13Po4cUSXoxXNT8kDuTD1Q1OQDc9T2EDq42EP/PDKUPEXnt4B6nyuOStBDkTUDu8oxLg=
X-Received: from pfgu35.prod.google.com ([2002:a05:6a00:9a3:b0:772:8559:f89f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:734d:b0:24b:c7d9:88e4
 with SMTP id adf61e73a8af0-24bc7d99007mr7502786637.42.1757060606101; Fri, 05
 Sep 2025 01:23:26 -0700 (PDT)
Date: Fri, 5 Sep 2025 01:23:17 -0700
In-Reply-To: <CAHBxVyHFkNtFdX-vciPvYnTOH=GXvHVW7hjFrLA4MFr9wqWVvQ@mail.gmail.com>
Mime-Version: 1.0
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
 <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com> <aLIR3deQPxVI2VrE@google.com>
 <CAHBxVyHFkNtFdX-vciPvYnTOH=GXvHVW7hjFrLA4MFr9wqWVvQ@mail.gmail.com>
Message-ID: <aLqd9bKB6ucarR3e@google.com>
Subject: Re: [PATCH v5 6/9] KVM: Add a helper function to check if a gpa is in
 writable memselot
From: Sean Christopherson <seanjc@google.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_012327_680260_20900495 
X-CRM114-Status: GOOD (  25.31  )
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

T24gV2VkLCBTZXAgMDMsIDIwMjUsIEF0aXNoIEt1bWFyIFBhdHJhIHdyb3RlOgo+IE9uIEZyaSwg
QXVnIDI5LCAyMDI1IGF0IDE6NDfigK9QTSBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBBdWcgMjksIDIwMjUsIEF0aXNoIFBhdHJh
IHdyb3RlOgo+ID4gPiArc3RhdGljIGlubGluZSBib29sIGt2bV9pc19ncGFfaW5fd3JpdGFibGVf
bWVtc2xvdChzdHJ1Y3Qga3ZtICprdm0sIGdwYV90IGdwYSkKPiA+ID4gK3sKPiA+ID4gKyAgICAg
Ym9vbCB3cml0YWJsZTsKPiA+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBodmEgPSBnZm5fdG9faHZh
X3Byb3Qoa3ZtLCBncGFfdG9fZ2ZuKGdwYSksICZ3cml0YWJsZSk7Cj4gPiA+ICsKPiA+ID4gKyAg
ICAgcmV0dXJuICFrdm1faXNfZXJyb3JfaHZhKGh2YSkgJiYgd3JpdGFibGU7Cj4gPgo+ID4gSSBk
b24ndCBoYXRlIHRoaXMgQVBJLCBidXQgSSBkb24ndCBsb3ZlIGl0IGVpdGhlci4gIEJlY2F1c2Ug
a25vd2luZyB0aGF0IHRoZQo+ID4gX21lbXNsb3RfIGlzIHdyaXRhYmxlIGRvZXNuJ3QgbWVhbiBh
bGwgdGhhdCBtdWNoLiAgRS5nLiBpbiB0aGlzIHVzYWdlOgo+ID4KPiA+ICAgICAgICAgaHZhID0g
a3ZtX3ZjcHVfZ2ZuX3RvX2h2YV9wcm90KHZjcHUsIHNobWVtID4+IFBBR0VfU0hJRlQsICZ3cml0
YWJsZSk7Cj4gPiAgICAgICAgIGlmIChrdm1faXNfZXJyb3JfaHZhKGh2YSkgfHwgIXdyaXRhYmxl
KQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFMSURfQUREUkVTUzsKPiA+
Cj4gPiAgICAgICAgIHJldCA9IGt2bV92Y3B1X3dyaXRlX2d1ZXN0KHZjcHUsIHNobWVtLCAmemVy
b19zdGEsIHNpemVvZih6ZXJvX3N0YSkpOwo+ID4gICAgICAgICBpZiAocmV0KQo+ID4gICAgICAg
ICAgICAgICAgIHJldHVybiBTQklfRVJSX0ZBSUxVUkU7Cj4gPgo+ID4gdGhlIGVycm9yIGNvZGUg
cmV0dXJuZWQgdG8gdGhlIGd1ZXN0IHdpbGwgYmUgZGlmZmVyZW50IGlmIHRoZSBtZW1zbG90IGlz
IHJlYWQtb25seQo+ID4gdmVyc3VzIGlmIHRoZSBWTUEgaXMgcmVhZC1vbmx5IChvciBub3QgZXZl
biBtYXBwZWQhKS4gIFVubGVzcyBldmVyeSByZWFkLW9ubHkKPiA+IG1lbXNsb3QgaXMgZXhwbGlj
aXRseSBjb21tdW5pY2F0ZWQgYXMgc3VjaCB0byB0aGUgZ3Vlc3QsIEkgZG9uJ3Qgc2VlIGhvdyB0
aGUgZ3Vlc3QKPiA+IGNhbiAqa25vdyogdGhhdCBhIG1lbXNsb3QgaXMgcmVhZC1vbmx5LCBzbyBy
ZXR1cm5pbmcgSU5WQUxJRF9BRERSRVNTIGluIHRoYXQgY2FzZQo+ID4gYnV0IG5vdCB3aGVuIHRo
ZSB1bmRlcmx5aW5nIFZNQSBpc24ndCB3cml0YWJsZSBzZWVtcyBvZGQuCj4gPgo+ID4gSXQncyBh
bHNvIGVudGlyZWx5IHBvc3NpYmxlIHRoZSBtZW1zbG90IGNvdWxkIGJlIHJlcGxhY2VkIHdpdGgg
YSByZWFkLW9ubHkgbWVtc2xvdAo+ID4gYWZ0ZXIgdGhlIGNoZWNrLCBvciB2aWNlIHZlcnNhLCBp
LmUuIGJlY29tZSB3cml0YWJsZSBhZnRlciBiZWluZyByZWplY3RlZC4gIElzIGl0Cj4gPiAqcmVh
bGx5KiBhIHByb2JsZW0gdG8gcmV0dXJuIEZBSUxVUkUgaWYgdGhlIGd1ZXN0IGF0dGVtcHRzIHRv
IHNldHVwIHN0ZWFsLXRpbWUgaW4KPiA+IGEgcmVhZC1vbmx5IG1lbXNsb3Q/ICBJLmUuIHdoeSBu
b3QgZG8gdGhpcyBhbmQgY2FsbCBpdCBnb29kPwo+ID4KPiAKPiBSZXBvc3RpbmcgdGhlIHJlc3Bv
bnNlIGFzIGdtYWlsIGNvbnZlcnRlZCBteSBwcmV2aW91cyByZXNwb25zZSBhcwo+IGh0bWwuIFNv
cnJ5IGZvciB0aGUgc3BhbS4KPiAKPiBGcm9tIGEgZnVuY3Rpb25hbGl0eSBwb3YsIHRoYXQgc2hv
dWxkIGJlIGZpbmUuIEhvd2V2ZXIsIHdlIGhhdmUKPiBleHBsaWNpdCBlcnJvciBjb25kaXRpb25z
IGZvciByZWFkIG9ubHkgbWVtb3J5IGRlZmluZWQgaW4gdGhlIFNCSSBTVEEKPiBzcGVjaWZpY2F0
aW9uWzFdLgo+IFRlY2huaWNhbGx5LCB3ZSB3aWxsIHZpb2xhdGUgdGhlIHNwZWMgaWYgd2UgcmV0
dXJuIEZBSUxVUkUgaW5zdGVhZCBvZgo+IElOVkFMSURfQUREUkVTUyBmb3IgcmVhZCBvbmx5IG1l
bXNsb3QuCgpCdXQgS1ZNIGlzIGFscmVhZHkgdmlvbGF0aW5nIHRoZSBzcGVjLCBhcyBrdm1fdmNw
dV93cml0ZV9ndWVzdCgpIHJlZG9lcyB0aGUKbWVtc2xvdCBsb29rdXAgYW5kIHNvIGNvdWxkIGVu
Y291bnRlciBhIHJlYWQtb25seSBtZW1zbG90IChpZiBpdCByYWNlcyB3aXRoCmEgbWVtc2xvdCB1
cGRhdGUpLCBhbmQgYmVjYXVzZSB0aGUgdW5kZXJseWluZyBtZW1vcnkgY291bGQgYmUgcmVhZC1v
bmx5IGV2ZW4gaWYKdGhlIG1lbXNsb3QgaXMgd3JpdGFibGUuCgpXaHkgbm90IHNpbXBseSByZXR1
cm4gU0JJX0VSUl9JTlZBTElEX0FERFJFU1Mgb24ga3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QoKSBmYWls
dXJlPwpUaGUgb25seSBkb3duc2lkZSBvZiB0aGF0IGlzIEtWTSB3aWxsIGFsc28gcmV0dXJuIFNC
SV9FUlJfSU5WQUxJRF9BRERSRVNTIGlmIHRoZQp1c2Vyc3BhY2UgbWFwcGluZyBpcyBjb21wbGV0
ZWx5IG1pc3NpbmcsIGJ1dCBBRkFJQ1QgdGhhdCBkb2Vzbid0IHNlZW0gdG8gYmUgYW4Kb3V0cmln
aHQgc3BlYyB2aW9sYXRpb24uCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2t2bS1yaXNjdgo=
