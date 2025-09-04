Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61899CA1015
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 06:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEOPKIzOMoD25XDPRQAIYJdK9bK/Yt0LbPQGUC7YH4Y=; b=pNlDSP80TchHxA
	cKF3Ys9wqiovfyeqEOcKBli7Mm5TXQUHCX1hNVaieIFx+EUqMrHEdlg74K84Yh8RHwKuw42LTMXit
	UQ7fOl78weL3SyzMuUCYYLun2Qu1CSHCU4UJn0nyGXifJY/svkbF3VaxER0R3WVsz5Cmeox3AP4Pw
	IX9cGrPpXpDjsEPmV0/lkIi6yfsxY7ai3CC0lZ4MgxUvDloGuVD9UNOnDELClsoXesGzdWLDMeUNm
	ehi/UXZoDLuS3zRzXR7xM4z4m0+xsQKXRgAIQhara2x7rRwq39gw/l6AGL23uhVRvf7uvsyYpzDlG
	6c2fpV8sVRPbo2NAukpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3Un-00000009Xc9-03OO;
	Thu, 04 Sep 2025 06:30:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3Oe-00000009ViH-1b8o
	for kvm-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 06:24:39 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-24c8ef94e5dso5617335ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 03 Sep 2025 23:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756967075; x=1757571875; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7qTV76ULDduJGVAW5YsdUFJhj9UbsymbqAIaKqb9Ys=;
        b=eI7TZyXz5ktIhDJsKAAMe3nvBwE5U39EKjzVGer3P0WV1fIM0ZbHJT3MwUOmqXilsV
         L0YsJ1n3yWsNGwcnXn9NVTt+qSqXcENYyIC8sWRJ7Fm8bOFWZz1yBlRQKgIl/tYwc+4q
         LWyhXFfpCHqpW1M5jQ8XfN8eoPMVsAdhjcH/N3bZDrpl95mBCU6Y66n6jLHWY9i+zqRX
         OIu+wX6U+i/wG42Y8aCCHuGoQ/RIHaUhEjKnO0PY79QGEZ7BpxlK9UgEP32KkTTBYLE1
         8SqKuCE+uZ3XVVYdYHqoJ2s5oC7y9b/9mYBKk/sU4mWn5KAtwWR4DuUhlNAn/WOHBN0m
         uclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756967075; x=1757571875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7qTV76ULDduJGVAW5YsdUFJhj9UbsymbqAIaKqb9Ys=;
        b=nxX9PiMFDtfFFyY5oNRJP7iqbZ3wtJYdb7aOp30F8iBWHaLrlXk5TspivhMQXYPPp5
         3s0RQm3iMRJzCw77gqCXuZL//HitCyO4OeIXwpr3EWJj0nLNTnUb4pMi3mhsBXlGKjeM
         GU5qAKljkGFHC33hoshWytldfl22xWdETYhcSMpEwxNJobwIwPt6N5EO9HBu3VYEjZYc
         C1EgELjrAj7mf1PYtQ4IVNXHhA9Vgu/0+3QEF4KukK0VdKklV5iUORFtr8JtaLBCm9gX
         qv63Ua6A18V11lEczKF2LeE+Ql3pf3sTCEw142kxfISqIf9r7H4CUKgqVDPOzu8aDRB6
         vFcg==
X-Forwarded-Encrypted: i=1; AJvYcCUS79pEio3Zlg9tKQ8gyUtX/ueelGj+7iDd5YSnTyRVmn7kVJhDMLrijlC3LEjvWcut9OaMNvVOMgM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxANgnl2dKGrlxCpnTmtqJCpHoM2h3Vkli1KrHGs6B8xhpIU8a
	DT4DxK8sBsp3HGhGxwFeT8+swSu4gx0o2UcOafzI7GYQcVsNHN/tsqSK4kgOgbh4uGsTGpC+iIR
	EhHU/xJWUv2oFx0PdCRBUb+d64W43siUSdQamUBfI4A==
X-Gm-Gg: ASbGncs+FI0Du2oLhb7DLcev4WrFGWP0ScmyXvqBVjCIZgdoRa6Gd9l7sdWyweUgocR
	WL5lUXIyDGkGffN1f2l5uJoxzsuWfsQjsTpT0fqFUJ0X8dj+SArYtEV0Wxqur0NeuS/4C8wow4N
	WglEs1ScQvqRaXM76CdJZOJ0Hz3GBnP1rj0vJGEQOpx0BwDwOGp23yW9/erMmq5OGOv/yoOKgtb
	vy+/+tmttkGMfKpqv2G
X-Google-Smtp-Source: AGHT+IHoFdxbuDjv07lVFMl22mnM/aIaMh25mvdbBCgh16ExZRzUOIBxo9SxO6MD4xOcEcTHtD3JYnMx67qXTku5mb0=
X-Received: by 2002:a17:902:d50c:b0:248:a642:eeeb with SMTP id
 d9443c01a7336-2493ef4dc88mr252425775ad.15.1756967075366; Wed, 03 Sep 2025
 23:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
 <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com> <aLIR3deQPxVI2VrE@google.com>
In-Reply-To: <aLIR3deQPxVI2VrE@google.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 3 Sep 2025 23:24:24 -0700
X-Gm-Features: Ac12FXyqcoq544W7rcjvkJ9YZPU7FqUqKJEMd-35Lr5ym4GwFkYYv0iByho1HQ4
Message-ID: <CAHBxVyHFkNtFdX-vciPvYnTOH=GXvHVW7hjFrLA4MFr9wqWVvQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] KVM: Add a helper function to check if a gpa is in
 writable memselot
To: Sean Christopherson <seanjc@google.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_232436_556026_9C6AE6E4 
X-CRM114-Status: GOOD (  31.01  )
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

T24gRnJpLCBBdWcgMjksIDIwMjUgYXQgMTo0N+KAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgQXVnIDI5LCAyMDI1LCBBdGlzaCBQ
YXRyYSB3cm90ZToKPiA+IFRoZSBhcmNoIHNwZWNpZmljIGNvZGUgbWF5IG5lZWQgdG8ga25vdyBp
ZiBhIHBhcnRpY3VsYXIgZ3BhIGlzIHZhbGlkIGFuZAo+ID4gd3JpdGFibGUgZm9yIHRoZSBzaGFy
ZWQgbWVtb3J5IGJldHdlZW4gdGhlIGhvc3QgYW5kIHRoZSBndWVzdC4gQ3VycmVudGx5LAo+ID4g
dGhlcmUgYXJlIGZldyBwbGFjZXMgd2hlcmUgaXQgaXMgdXNlZCBpbiBSSVNDLVYgaW1wbGVtZW50
YXRpb24uIEdpdmVuIHRoZQo+ID4gbmF0dXJlIG9mIHRoZSBmdW5jdGlvbiBpdCBtYXkgYmUgdXNl
ZCBmb3Igb3RoZXIgYXJjaGl0ZWN0dXJlcy4KPiA+IEhlbmNlLCBhIGNvbW1vbiBoZWxwZXIgZnVu
Y3Rpb24gaXMgYWRkZWQuCj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBTZWFuIENocmlzdG9waGVyc29u
IDxzZWFuamNAZ29vZ2xlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlz
aHBAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIHwg
OCArKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIGIvaW5jbHVkZS9saW51eC9rdm1f
aG9zdC5oCj4gPiBpbmRleCAxNTY1NmI3ZmJhNmMuLmVlYzVjYmJjYjRiMyAxMDA2NDQKPiA+IC0t
LSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9rdm1f
aG9zdC5oCj4gPiBAQCAtMTg5Miw2ICsxODkyLDE0IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBrdm1f
aXNfZ3BhX2luX21lbXNsb3Qoc3RydWN0IGt2bSAqa3ZtLCBncGFfdCBncGEpCj4gPiAgICAgICBy
ZXR1cm4gIWt2bV9pc19lcnJvcl9odmEoaHZhKTsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBpbmxp
bmUgYm9vbCBrdm1faXNfZ3BhX2luX3dyaXRhYmxlX21lbXNsb3Qoc3RydWN0IGt2bSAqa3ZtLCBn
cGFfdCBncGEpCj4gPiArewo+ID4gKyAgICAgYm9vbCB3cml0YWJsZTsKPiA+ICsgICAgIHVuc2ln
bmVkIGxvbmcgaHZhID0gZ2ZuX3RvX2h2YV9wcm90KGt2bSwgZ3BhX3RvX2dmbihncGEpLCAmd3Jp
dGFibGUpOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuICFrdm1faXNfZXJyb3JfaHZhKGh2YSkgJiYg
d3JpdGFibGU7Cj4KPiBJIGRvbid0IGhhdGUgdGhpcyBBUEksIGJ1dCBJIGRvbid0IGxvdmUgaXQg
ZWl0aGVyLiAgQmVjYXVzZSBrbm93aW5nIHRoYXQgdGhlCj4gX21lbXNsb3RfIGlzIHdyaXRhYmxl
IGRvZXNuJ3QgbWVhbiBhbGwgdGhhdCBtdWNoLiAgRS5nLiBpbiB0aGlzIHVzYWdlOgo+Cj4gICAg
ICAgICBodmEgPSBrdm1fdmNwdV9nZm5fdG9faHZhX3Byb3QodmNwdSwgc2htZW0gPj4gUEFHRV9T
SElGVCwgJndyaXRhYmxlKTsKPiAgICAgICAgIGlmIChrdm1faXNfZXJyb3JfaHZhKGh2YSkgfHwg
IXdyaXRhYmxlKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9JTlZBTElEX0FERFJF
U1M7Cj4KPiAgICAgICAgIHJldCA9IGt2bV92Y3B1X3dyaXRlX2d1ZXN0KHZjcHUsIHNobWVtLCAm
emVyb19zdGEsIHNpemVvZih6ZXJvX3N0YSkpOwo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIFNCSV9FUlJfRkFJTFVSRTsKPgo+IHRoZSBlcnJvciBjb2RlIHJldHVy
bmVkIHRvIHRoZSBndWVzdCB3aWxsIGJlIGRpZmZlcmVudCBpZiB0aGUgbWVtc2xvdCBpcyByZWFk
LW9ubHkKPiB2ZXJzdXMgaWYgdGhlIFZNQSBpcyByZWFkLW9ubHkgKG9yIG5vdCBldmVuIG1hcHBl
ZCEpLiAgVW5sZXNzIGV2ZXJ5IHJlYWQtb25seQo+IG1lbXNsb3QgaXMgZXhwbGljaXRseSBjb21t
dW5pY2F0ZWQgYXMgc3VjaCB0byB0aGUgZ3Vlc3QsIEkgZG9uJ3Qgc2VlIGhvdyB0aGUgZ3Vlc3QK
PiBjYW4gKmtub3cqIHRoYXQgYSBtZW1zbG90IGlzIHJlYWQtb25seSwgc28gcmV0dXJuaW5nIElO
VkFMSURfQUREUkVTUyBpbiB0aGF0IGNhc2UKPiBidXQgbm90IHdoZW4gdGhlIHVuZGVybHlpbmcg
Vk1BIGlzbid0IHdyaXRhYmxlIHNlZW1zIG9kZC4KPgo+IEl0J3MgYWxzbyBlbnRpcmVseSBwb3Nz
aWJsZSB0aGUgbWVtc2xvdCBjb3VsZCBiZSByZXBsYWNlZCB3aXRoIGEgcmVhZC1vbmx5IG1lbXNs
b3QKPiBhZnRlciB0aGUgY2hlY2ssIG9yIHZpY2UgdmVyc2EsIGkuZS4gYmVjb21lIHdyaXRhYmxl
IGFmdGVyIGJlaW5nIHJlamVjdGVkLiAgSXMgaXQKPiAqcmVhbGx5KiBhIHByb2JsZW0gdG8gcmV0
dXJuIEZBSUxVUkUgaWYgdGhlIGd1ZXN0IGF0dGVtcHRzIHRvIHNldHVwIHN0ZWFsLXRpbWUgaW4K
PiBhIHJlYWQtb25seSBtZW1zbG90PyAgSS5lLiB3aHkgbm90IGRvIHRoaXMgYW5kIGNhbGwgaXQg
Z29vZD8KPgoKUmVwb3N0aW5nIHRoZSByZXNwb25zZSBhcyBnbWFpbCBjb252ZXJ0ZWQgbXkgcHJl
dmlvdXMgcmVzcG9uc2UgYXMKaHRtbC4gU29ycnkgZm9yIHRoZSBzcGFtLgoKRnJvbSBhIGZ1bmN0
aW9uYWxpdHkgcG92LCB0aGF0IHNob3VsZCBiZSBmaW5lLiBIb3dldmVyLCB3ZSBoYXZlCmV4cGxp
Y2l0IGVycm9yIGNvbmRpdGlvbnMgZm9yIHJlYWQgb25seSBtZW1vcnkgZGVmaW5lZCBpbiB0aGUg
U0JJIFNUQQpzcGVjaWZpY2F0aW9uWzFdLgpUZWNobmljYWxseSwgd2Ugd2lsbCB2aW9sYXRlIHRo
ZSBzcGVjIGlmIHdlIHJldHVybiBGQUlMVVJFIGluc3RlYWQgb2YKSU5WQUxJRF9BRERSRVNTIGZv
ciByZWFkIG9ubHkgbWVtc2xvdC4KClRCSCwgSSBkb24ndCBzYXZlIG11Y2ggZHVwbGljYXRlIGNv
ZGUgd2l0aCB0aGUgbmV3IGdlbmVyaWMgQVBJIG5vdy4KSWYgeW91IGRvbid0IHNlZSBpZiB0aGUg
Z2VuZXJpYyBBUEkgd2lsbCBiZSB1c2VmdWwgaW4gb3RoZXIgY2FzZXMsIEkKY2FuIGRyb3AgdGhh
dCBwYXRjaCBhbmQgY2hhbmdlcyBpbiB0aGUgc3RlYWwgdGltZSBjb2RlLgoKWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvYmxvYi9tYXN0ZXIvc3JjL2V4
dC1zdGVhbC10aW1lLmFkb2MjdGFibGVfc3RhX3N0ZWFsX3RpbWVfc2V0X3NobWVtX2Vycm9ycwo+
ICAgICAgICAgaWYgKCFrdm1faXNfZ3BhX2luX21lbXNsb3QodmNwdS0+a3ZtLCBzaG1lbSA+PiBQ
QUdFX1NISUZUKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9BRERS
RVNTOwo+Cj4gICAgICAgICByZXQgPSBrdm1fdmNwdV93cml0ZV9ndWVzdCh2Y3B1LCBzaG1lbSwg
Jnplcm9fc3RhLCBzaXplb2YoemVyb19zdGEpKTsKPiAgICAgICAgIGlmIChyZXQpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiBTQklfRVJSX0ZBSUxVUkU7CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcg
bGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
