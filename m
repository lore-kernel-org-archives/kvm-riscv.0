Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863CFCA0FED
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Sep 2025 00:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2xlKtAZIESXpT3oDkhsZhOnvs+re3EpeYYQ8sD3EmE=; b=pvICkcIcxFvJkn
	V0plvHZQXpfNSm8KZxv8JNvoY9lbDWV5WB9OvdQ6slIj4UVSw5CorcXG0kCXO+uAHQ+UKkl7zWjYT
	Xcr6ptQEFT+fkbGFWFZKoZEcP2ar6ihLucGGAUpooMdTdjxpujeFHAS+4kcHlxA5FrUI5QtBWeiQ/
	vWe6HxFn+0AY3kh+APYGFEQhKfHcz+Y8AcwckS8tIWPkUF+EY9SfSrrROavjOqrLhee53neg99fMv
	vlY2Tn5MxsbFMrGpTHAt2lq7+ihBSNmFJIVPqRToanOYCDF+tONZRKr2oJm5JnBpGUDeqj19Ob8cw
	ie92EZayvy39LsqjYENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugY0-00000005WIh-1XZP;
	Sat, 06 Sep 2025 00:12:52 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uucD8-00000004CFO-2gH2
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 19:35:05 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-32bab30eefbso1733643a91.1
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Sep 2025 12:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757100901; x=1757705701; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9FAMAwKb9GlFbqFePz07zPDAIQCDZGG7K5Xfr8FjoY=;
        b=R15TSiKuOtr+VO0k+cLiufAA3YBFxiw1b6wi2NWkb49GKiimmFbSdXKjAl+AHa41WY
         yWTlibI2eNOr5PlZfNx1WjUDViKv8oQewVtitCtsIRfxc5hmag1szFRGWZEeDtzL6bPR
         EnmXzQpiqu+Qr2Tn61PwEwYWcPBOKSlPmSrQcwYDkAAg+oGK2s9He4XVlYiYjxB7K5g8
         JdcJjykgBCkwlAD83a7KjSkTcGXqTTc/GMPzADb6+ZKu0ho39Z7rJDw8SXBBSooi9JiI
         noqTLSyHrXpwKvKz9V80NJwI4trQyvYFZD/2eIZmomIvdYLXaczYxPjkX33r8CQQLUJQ
         B0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757100901; x=1757705701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9FAMAwKb9GlFbqFePz07zPDAIQCDZGG7K5Xfr8FjoY=;
        b=e4okCyOAUZjPWZcx9VTPWeYfFZ3Bv+sPjuokzHaLHnlPeI+HN5pB1Z6E6D5OtndniY
         gQUESSWwtcigzW8KhQUd0YUlRifSoFwfWw5Lpy2ypCeEB93Xf2o+KX15myzmdeCKs5NX
         pzV7cwtpx/NAWCDhtH9KyQtd+NTHRZ5lA3xcpYfDBUbYAycMNLfLvungO+a3WoJGOyyt
         DjLY4zPtIRimdycem5wqzU6zkWYI4AX0ReKYYrnzEbbG5G2Dj4b/M5vatB9WD6T7kkAQ
         +b2xx9/KsBRKmI3PYJ8VaxJm2tMe2pE0Yer7WjNUiMPJwJSTVc8yFYXmnNZNYpoPDBqV
         Z6wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpzxAfEk33r9Zz6ZkDaBmOfNm10SaWwmJPlX8NMvwbp1FTa78AWWDI4DKk2MM59iAi2PzAtK197rg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPU3T3KPemAh0Coa+RUYiGVv1T3ae6pA5kZn44b/b2yypeSnJq
	O59vgCTHZeBTK0TRUl7DvlWx+IhO9MDnUpodDrqATVuFxmm5d2txnm0IcdMjkSjfSgAD6uQ0LzS
	g+h5Y0wOiLBKFs3kv/KIh2MRria0AwYzTMLuyg3c/JQ==
X-Gm-Gg: ASbGncu5QDQb2Ua1SL+nG4g0TUOaaCblOy/JtohjScDlCoayrG1VsBt2EeMxitdoL5k
	T1uAXrBb3CXosb7QWRBQkVpwfdYXPYQ9lwQWbUmf6i2fo2l8tpgMle08PcSCY7IrbZgI8OtzbUt
	6FAl6kntmXGcPiRXEcgfVC94kpAv11bABjtzVeMLeRgT7ALMB/44ed7D+ISANZ7U1gQKMD/vJ3Y
	u5O2ztvkQ/cd3Nnv8DCu1UZ4U3XKg==
X-Google-Smtp-Source: AGHT+IHqWqyZqFIuzyIZvE/SUKQfYYN6g516wmc4GuFbgQsfUPht0NsXKsfItF2EyucT/HQ/Jt/iNNsDf0c9xrLH2sg=
X-Received: by 2002:a17:90b:3c44:b0:32b:6223:262 with SMTP id
 98e67ed59e1d1-32bbcb945aemr5935479a91.3.1757100901459; Fri, 05 Sep 2025
 12:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
 <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com> <aLIR3deQPxVI2VrE@google.com>
 <CAHBxVyHFkNtFdX-vciPvYnTOH=GXvHVW7hjFrLA4MFr9wqWVvQ@mail.gmail.com> <aLqd9bKB6ucarR3e@google.com>
In-Reply-To: <aLqd9bKB6ucarR3e@google.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 5 Sep 2025 12:34:48 -0700
X-Gm-Features: Ac12FXzDuYbaevvtu1cjWIBdIgE-JZvhAwCG0_v0qb1Ic8gyKF3DjAY5IEIX5wM
Message-ID: <CAHBxVyE7Tp97GfbH=deaA7gqWQXByno3O3OHbHDJCJ=J7FUQvw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250905_123502_729651_7079CA92 
X-CRM114-Status: GOOD (  30.72  )
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

T24gRnJpLCBTZXAgNSwgMjAyNSBhdCAxOjIz4oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMDMsIDIwMjUsIEF0aXNoIEt1
bWFyIFBhdHJhIHdyb3RlOgo+ID4gT24gRnJpLCBBdWcgMjksIDIwMjUgYXQgMTo0N+KAr1BNIFNl
YW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4g
T24gRnJpLCBBdWcgMjksIDIwMjUsIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gPiA+ICtzdGF0aWMg
aW5saW5lIGJvb2wga3ZtX2lzX2dwYV9pbl93cml0YWJsZV9tZW1zbG90KHN0cnVjdCBrdm0gKmt2
bSwgZ3BhX3QgZ3BhKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgYm9vbCB3cml0YWJsZTsKPiA+
ID4gPiArICAgICB1bnNpZ25lZCBsb25nIGh2YSA9IGdmbl90b19odmFfcHJvdChrdm0sIGdwYV90
b19nZm4oZ3BhKSwgJndyaXRhYmxlKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgcmV0dXJuICFr
dm1faXNfZXJyb3JfaHZhKGh2YSkgJiYgd3JpdGFibGU7Cj4gPiA+Cj4gPiA+IEkgZG9uJ3QgaGF0
ZSB0aGlzIEFQSSwgYnV0IEkgZG9uJ3QgbG92ZSBpdCBlaXRoZXIuICBCZWNhdXNlIGtub3dpbmcg
dGhhdCB0aGUKPiA+ID4gX21lbXNsb3RfIGlzIHdyaXRhYmxlIGRvZXNuJ3QgbWVhbiBhbGwgdGhh
dCBtdWNoLiAgRS5nLiBpbiB0aGlzIHVzYWdlOgo+ID4gPgo+ID4gPiAgICAgICAgIGh2YSA9IGt2
bV92Y3B1X2dmbl90b19odmFfcHJvdCh2Y3B1LCBzaG1lbSA+PiBQQUdFX1NISUZULCAmd3JpdGFi
bGUpOwo+ID4gPiAgICAgICAgIGlmIChrdm1faXNfZXJyb3JfaHZhKGh2YSkgfHwgIXdyaXRhYmxl
KQo+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9BRERSRVNTOwo+
ID4gPgo+ID4gPiAgICAgICAgIHJldCA9IGt2bV92Y3B1X3dyaXRlX2d1ZXN0KHZjcHUsIHNobWVt
LCAmemVyb19zdGEsIHNpemVvZih6ZXJvX3N0YSkpOwo+ID4gPiAgICAgICAgIGlmIChyZXQpCj4g
PiA+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9GQUlMVVJFOwo+ID4gPgo+ID4gPiB0
aGUgZXJyb3IgY29kZSByZXR1cm5lZCB0byB0aGUgZ3Vlc3Qgd2lsbCBiZSBkaWZmZXJlbnQgaWYg
dGhlIG1lbXNsb3QgaXMgcmVhZC1vbmx5Cj4gPiA+IHZlcnN1cyBpZiB0aGUgVk1BIGlzIHJlYWQt
b25seSAob3Igbm90IGV2ZW4gbWFwcGVkISkuICBVbmxlc3MgZXZlcnkgcmVhZC1vbmx5Cj4gPiA+
IG1lbXNsb3QgaXMgZXhwbGljaXRseSBjb21tdW5pY2F0ZWQgYXMgc3VjaCB0byB0aGUgZ3Vlc3Qs
IEkgZG9uJ3Qgc2VlIGhvdyB0aGUgZ3Vlc3QKPiA+ID4gY2FuICprbm93KiB0aGF0IGEgbWVtc2xv
dCBpcyByZWFkLW9ubHksIHNvIHJldHVybmluZyBJTlZBTElEX0FERFJFU1MgaW4gdGhhdCBjYXNl
Cj4gPiA+IGJ1dCBub3Qgd2hlbiB0aGUgdW5kZXJseWluZyBWTUEgaXNuJ3Qgd3JpdGFibGUgc2Vl
bXMgb2RkLgo+ID4gPgo+ID4gPiBJdCdzIGFsc28gZW50aXJlbHkgcG9zc2libGUgdGhlIG1lbXNs
b3QgY291bGQgYmUgcmVwbGFjZWQgd2l0aCBhIHJlYWQtb25seSBtZW1zbG90Cj4gPiA+IGFmdGVy
IHRoZSBjaGVjaywgb3IgdmljZSB2ZXJzYSwgaS5lLiBiZWNvbWUgd3JpdGFibGUgYWZ0ZXIgYmVp
bmcgcmVqZWN0ZWQuICBJcyBpdAo+ID4gPiAqcmVhbGx5KiBhIHByb2JsZW0gdG8gcmV0dXJuIEZB
SUxVUkUgaWYgdGhlIGd1ZXN0IGF0dGVtcHRzIHRvIHNldHVwIHN0ZWFsLXRpbWUgaW4KPiA+ID4g
YSByZWFkLW9ubHkgbWVtc2xvdD8gIEkuZS4gd2h5IG5vdCBkbyB0aGlzIGFuZCBjYWxsIGl0IGdv
b2Q/Cj4gPiA+Cj4gPgo+ID4gUmVwb3N0aW5nIHRoZSByZXNwb25zZSBhcyBnbWFpbCBjb252ZXJ0
ZWQgbXkgcHJldmlvdXMgcmVzcG9uc2UgYXMKPiA+IGh0bWwuIFNvcnJ5IGZvciB0aGUgc3BhbS4K
PiA+Cj4gPiBGcm9tIGEgZnVuY3Rpb25hbGl0eSBwb3YsIHRoYXQgc2hvdWxkIGJlIGZpbmUuIEhv
d2V2ZXIsIHdlIGhhdmUKPiA+IGV4cGxpY2l0IGVycm9yIGNvbmRpdGlvbnMgZm9yIHJlYWQgb25s
eSBtZW1vcnkgZGVmaW5lZCBpbiB0aGUgU0JJIFNUQQo+ID4gc3BlY2lmaWNhdGlvblsxXS4KPiA+
IFRlY2huaWNhbGx5LCB3ZSB3aWxsIHZpb2xhdGUgdGhlIHNwZWMgaWYgd2UgcmV0dXJuIEZBSUxV
UkUgaW5zdGVhZCBvZgo+ID4gSU5WQUxJRF9BRERSRVNTIGZvciByZWFkIG9ubHkgbWVtc2xvdC4K
Pgo+IEJ1dCBLVk0gaXMgYWxyZWFkeSB2aW9sYXRpbmcgdGhlIHNwZWMsIGFzIGt2bV92Y3B1X3dy
aXRlX2d1ZXN0KCkgcmVkb2VzIHRoZQo+IG1lbXNsb3QgbG9va3VwIGFuZCBzbyBjb3VsZCBlbmNv
dW50ZXIgYSByZWFkLW9ubHkgbWVtc2xvdCAoaWYgaXQgcmFjZXMgd2l0aAo+IGEgbWVtc2xvdCB1
cGRhdGUpLCBhbmQgYmVjYXVzZSB0aGUgdW5kZXJseWluZyBtZW1vcnkgY291bGQgYmUgcmVhZC1v
bmx5IGV2ZW4gaWYKPiB0aGUgbWVtc2xvdCBpcyB3cml0YWJsZS4KPgoKQWhoLiBUaGFua3MgZm9y
IGNsYXJpZnlpbmcgdGhhdC4KCj4gV2h5IG5vdCBzaW1wbHkgcmV0dXJuIFNCSV9FUlJfSU5WQUxJ
RF9BRERSRVNTIG9uIGt2bV92Y3B1X3dyaXRlX2d1ZXN0KCkgZmFpbHVyZT8KPiBUaGUgb25seSBk
b3duc2lkZSBvZiB0aGF0IGlzIEtWTSB3aWxsIGFsc28gcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9B
RERSRVNTIGlmIHRoZQo+IHVzZXJzcGFjZSBtYXBwaW5nIGlzIGNvbXBsZXRlbHkgbWlzc2luZywg
YnV0IEFGQUlDVCB0aGF0IGRvZXNuJ3Qgc2VlbSB0byBiZSBhbgo+IG91dHJpZ2h0IHNwZWMgdmlv
bGF0aW9uLgoKWWVzLiBUaGF0J3MgY29ycmVjdC4gVGhhdCBjYW4gc3RpbGwgYmUgY29uc2lkZXJl
ZCBhcyBpbnZhbGlkIGFkZHJlc3MuCkkgd2lsbCByZXZpc2UgdGhlIHBhdGNoIGFjY29yZGluZyB0
byB0aGlzLgpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9ucy4KCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
