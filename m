Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02EDC369CB
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 06:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGjbJ85WVZ+nIB0jdryOXGzBQ2wvdED3xR0GyNUz4Js=; b=g8s86M7w6NoyVX
	427qr5EqCq2+7+Hqyk8/HxXlABKicmrVmMXUrftNBOjBdnrRrTB6Mm45IlILrbJ3MyGo0lS7l7VA2
	I+bQVg2WEIIS8vYsce6yPrK5cIZk8CoBqW5ZMZ1mY76VK+cltuv3bvSRe+mDHqFV7fXDrLzf/5vWw
	0CBMV2uzwtIinIXGXBoUSkDmA4kbiTWLzzdEv1x1lEn3lMsnyv68z0HDDA8At87uvAzG6uVMT/prF
	oVlrNEs+o1TxEwpd2/gT+PrcytjAzMHPwzlgoj9wCFX0qayHxcoAp1185M4pqF2Cd755c6e3AhX4D
	8YrKwzdNgTOe2dOp3mOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ZIm-00000001aG4-15Hv;
	Sat, 26 Apr 2025 06:46:16 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ytv-00000001XiA-3xuf
	for kvm-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 06:20:37 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-549b116321aso3579627e87.3
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Apr 2025 23:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745648433; x=1746253233; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhIlsDoQs6LRS20p0rNxcpX7bYzDaT/ai2nTquRWNJ4=;
        b=jXlJDebYhT6cbbCZLa+oU4E0PCiFe00tnr4hOGDIP2DD9h8y4xhUNsG2eOCQUpyLdS
         3J3m4pYy6dKDgEQRVMsV6fQKYN9K3qrc4smN2vb1IsyemUHbBmUyWgbdc97fOXb834yQ
         tO+3CGaN54nAb5gJRmv5MctbvS7/QQb5AvPj8dFix2xYInU5wJgzQo6r1JPoTi/8lvH9
         TwtzDC9MjAOWZpOIwaxVdSgugpIsPLtoteIqvpdhf351ywLjzcGbli4+kHjDAjF29iqw
         L9P6abAmtb08GpAYuU6Q0jsU4YaKzYNzM3CjdBov2TcakuovuOAGjaOohYJOhWY6ws0u
         sx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745648433; x=1746253233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhIlsDoQs6LRS20p0rNxcpX7bYzDaT/ai2nTquRWNJ4=;
        b=vr6XTjprMSYbcxNqmL3kvYm/NUJEUySCh3GYfSO4g3kX+UuUcc9t1gugbZgAibZ9Nt
         oJgaiiNMdQQieSy+7ma1IEY8VZyE03IMWN0A/AdRXWBwpkbkIgIeRKN4ntkiFiF+y4s6
         R5/Y2fInhoMzpsIj3zx4fwlzmfxNU71f9xvdsvRly3/E7ckAR3j99RZazh4PRdSMA6BP
         M1aheVG0OWsTJadyvlWhLbm2yKxXpNvCx4QP9k0EgbovQVxLFrmkWtBoPEB7Oac6Xyvk
         B33RaJlDtprztaeId8ZK0disT0jTNmqjRtWvxC8mEh1jgeedwQLG2Mm2H+oySrDXmIov
         hqwA==
X-Forwarded-Encrypted: i=1; AJvYcCX2Y8G0oX/9nbqaa8Xx0UGx3eUNW2QIf45RmlTIt4MDIKU8p8Z6NfjpCYcPzZ7Pl/aL0EjbUfl5hTE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk6wo688pyg0OYmFQvQ0PvuRF2rYUpJFWLBg6pMc/3ThQa+2OI
	4TZBlj1C2i9HKp+0gjuNfSqceJp88nX2+Lh3azvquwq7yFQMGYOhbSuG3qPz7NyH7DJW7AAGiJL
	QuCAVxLM45kKKSYG3U7WlLmMHalhgtWFjAIV8Xw==
X-Gm-Gg: ASbGncu5ho6P3OCi6rTpFUAsynSZ4PO5mjLlBFR4jxY/8YWCUsn2NJGPpqsY0pryeP5
	n9Wh1LB6ysxVFSfaZV681h1uG42KwREPHP52q/3kzZsLf+uNpbIU1g1EuXGhZxxVQryG8R+d29D
	ziuHOR1k2szhLz3DI4Nb/6fM4=
X-Google-Smtp-Source: AGHT+IHJX8kShg4vw42ljFxBtrSxnj4CRMgyhaOeQRBqP8s/W/qCbdQyZl/wjbUn9VK8/6qB/enzbHcVFG8hmTC2xR8=
X-Received: by 2002:a05:6512:1245:b0:545:6fa:bf60 with SMTP id
 2adb3069b0e04-54e8ffd16aemr400439e87.19.1745648433251; Fri, 25 Apr 2025
 23:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250424153159.289441-1-apatel@ventanamicro.com>
 <20250424153159.289441-11-apatel@ventanamicro.com> <20250425-c0a3a93239d39b73ff176697@orel>
In-Reply-To: <20250425-c0a3a93239d39b73ff176697@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 26 Apr 2025 11:50:20 +0530
X-Gm-Features: ATxdqUG3_pY0cK5X4HGASNC9Rzb6yplJE52I4EQ3dAO9a3v1qh0QWLhZugC-APQ
Message-ID: <CAK9=C2X8ZfzACU1LB8BqSZb3nf8P3xvfAQeNznHPagUhDUnd-g@mail.gmail.com>
Subject: Re: [kvmtool PATCH v2 10/10] riscv: Allow including extensions in the
 min CPU type using command-line
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_232035_984304_7250C1B0 
X-CRM114-Status: GOOD (  26.59  )
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

T24gRnJpLCBBcHIgMjUsIDIwMjUgYXQgNjoxM+KAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMDk6MDE6
NTlQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IEl0IGlzIHVzZWZ1bCB0byBhbGxvdyBp
bmNsdWRpbmcgZXh0ZW5zaW9ucyBpbiB0aGUgbWluIENQVSB0eXBlIG9uIG5lZWQKPiA+IGJhc2lz
IHZpYSBjb21tYW5kLWxpbmUuIFRvIGFjaGlldmUgdGhpcywgcGFyc2UgZXh0ZW5zaW9uIG5hbWVz
IGFzIGNvbW1hCj4gPiBzZXBhcmF0ZWQgdmFsdWVzIGFwcGVuZGVkIHRvIHRoZSAibWluIiBDUFUg
dHlwZSB1c2luZyBjb21tYW5kLWxpbmUuCj4gPgo+ID4gRm9yIGV4YW1wbGUsIHRvIGluY2x1ZGUg
U3N0YyBhbmQgU3NhaWEgaW4gdGhlIG1pbiBDUFUgdHlwZSB1c2UKPiA+ICItLWNwdS10eXBlIG1p
bixzc3RjLHNzYWlhIiBjb21tYW5kLWxpbmUgb3B0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgcmlzY3Yv
ZmR0LmMgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL3Jpc2N2L2ZkdC5jIGIvcmlzY3YvZmR0LmMKPiA+IGluZGV4IDVkOWI5
YmYuLjcyMjQ5M2EgMTAwNjQ0Cj4gPiAtLS0gYS9yaXNjdi9mZHQuYwo+ID4gKysrIGIvcmlzY3Yv
ZmR0LmMKPiA+IEBAIC0xMDgsNiArMTA4LDIwIEBAIHN0YXRpYyBib29sIF9faXNhX2V4dF93YXJu
X2Rpc2FibGVfZmFpbHVyZShzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBpc2FfZXh0X2luZm8KPiA+
ICAgICAgIHJldHVybiB0cnVlOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIHZvaWQgX19taW5fZW5h
YmxlKGNvbnN0IGNoYXIgKmV4dCwgc2l6ZV90IGV4dF9sZW4pCj4gPiArewo+ID4gKyAgICAgc3Ry
dWN0IGlzYV9leHRfaW5mbyAqaW5mbzsKPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgaTsKPiA+ICsK
PiA+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGlzYV9pbmZvX2Fycik7IGkrKykg
ewo+ID4gKyAgICAgICAgICAgICBpbmZvID0gJmlzYV9pbmZvX2FycltpXTsKPiA+ICsgICAgICAg
ICAgICAgaWYgKHN0cmxlbihpbmZvLT5uYW1lKSAhPSBleHRfbGVuKQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGNvbnRpbnVlOwo+ID4gKyAgICAgICAgICAgICBpZiAoIXN0cm5jbXAoZXh0LCBp
bmZvLT5uYW1lLCBleHRfbGVuKSkKPgo+IEp1c3Qgc3RyY21wIHNpbmNlIHdlIGFscmVhZHkgY2hl
Y2tlZCB0aGUgbGVuZ3RoIGFuZCB3b3VsZG4ndCB3YW50Cj4gc29tZXRoaW5nIGxpa2UgaW5mby0+
bmFtZSA9IG1tbW1ubm5uIHRvIG1hdGNoIGV4dCA9IG1tbW0gYW55d2F5LgoKKExpa2UgbWVudGlv
bmVkIGluIG15IGNvbW1lbnQgaW4gdGhlIHBhc3QgcmV2aXNpb24gLi4uKQoKVGhlICJleHQiIGlz
IG5vdCBzaW1wbHkgYW4gZXh0ZW5zaW9uIG5hbWUgcmF0aGVyIHNvbWV0aGluZwpsaWtlICJtbW1t
LHh5eixhYmMiIChzdWZmaXggb2YgY29tbWEgc2VwYXJhdGVkIHN0cmluZykgc28KYSBwbGFpbiBz
dHJjbXAoKSB3aWxsIGZhaWwgZXZlbiBpZiBleHRlbnNpb24gbGVuZ3RoIGlzIGFscmVhZHkKY2hl
Y2tlZC4KCj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICBpbmZvLT5taW5fZW5hYmxlZCA9IHRy
dWU7Cj4gPiArICAgICB9Cj4gPiArfQo+ID4gKwo+ID4gIGJvb2wgcmlzY3ZfX2lzYV9leHRlbnNp
b25fZGlzYWJsZWQoc3RydWN0IGt2bSAqa3ZtLCB1bnNpZ25lZCBsb25nIGlzYV9leHRfaWQpCj4g
PiAgewo+ID4gICAgICAgc3RydWN0IGlzYV9leHRfaW5mbyAqaW5mbyA9IE5VTEw7Cj4gPiBAQCAt
MTI4LDE1ICsxNDIsMzggQEAgYm9vbCByaXNjdl9faXNhX2V4dGVuc2lvbl9kaXNhYmxlZChzdHJ1
Y3Qga3ZtICprdm0sIHVuc2lnbmVkIGxvbmcgaXNhX2V4dF9pZCkKPiA+ICBpbnQgcmlzY3ZfX2Nw
dV90eXBlX3BhcnNlcihjb25zdCBzdHJ1Y3Qgb3B0aW9uICpvcHQsIGNvbnN0IGNoYXIgKmFyZywg
aW50IHVuc2V0KQo+ID4gIHsKPiA+ICAgICAgIHN0cnVjdCBrdm0gKmt2bSA9IG9wdC0+cHRyOwo+
ID4gKyAgICAgY29uc3QgY2hhciAqc3RyLCAqbnN0cjsKPiA+ICsgICAgIGludCBsZW47Cj4gPgo+
ID4gLSAgICAgaWYgKChzdHJuY21wKGFyZywgIm1pbiIsIDMpICYmIHN0cm5jbXAoYXJnLCAibWF4
IiwgMykpIHx8IHN0cmxlbihhcmcpICE9IDMpCj4gPiArICAgICBpZiAoKHN0cm5jbXAoYXJnLCAi
bWluIiwgMykgfHwgc3RybGVuKGFyZykgPCAzKSAmJgo+Cj4gVGhlIHN0cmxlbihhcmcpIDwgMyB3
aWxsIG5ldmVyIGJlIHRydWUgYmVjYXVzZSBpZiBzdHJuY21wKGFyZywgIm1pbiIsIDMpCj4gcmV0
dXJucyAwIChmYWxzZSksIHRoZW4gdGhhdCBtZWFucyBhcmcgc3RhcnRzIHdpdGggJ21pbicsIGFu
ZCB0aGVyZWZvcmUKPiBjYW4ndCBoYXZlIGEgbGVuZ3RoIGxlc3MgdGhhbiAzLiBBbmQsIGlmIHN0
cm5jbXAoYXJnLCAibWluIiwgMykgcmV0dXJucwo+IG5vbnplcm8sIHRoZW4gdGhlICd8fCBleHBy
ZXNzaW9uJyB3aWxsIGJlIHNob3J0LWNpcmN1aXRlZC4KPgo+ID4gKyAgICAgICAgIChzdHJuY21w
KGFyZywgIm1heCIsIDMpIHx8IHN0cmxlbihhcmcpICE9IDMpKQo+Cj4gU28KPgo+ICBpZiAoc3Ry
bmNtcChhcmcsICJtaW4iLCAzKSAmJiAoc3RybmNtcChhcmcsICJtYXgiLCAzKSB8fCBzdHJsZW4o
YXJnKSAhPSAzKSkKPgo+IHNob3VsZCBkbyBpdC4KCk9rYXksIEkgd2lsbCB1cGRhdGUuCgo+Cj4g
PiAgICAgICAgICAgICAgIGRpZSgiSW52YWxpZCBDUFUgdHlwZSAlc1xuIiwgYXJnKTsKPiA+Cj4g
PiAtICAgICBpZiAoIXN0cmNtcChhcmcsICJtYXgiKSkKPiA+ICsgICAgIGlmICghc3RyY21wKGFy
ZywgIm1heCIpKSB7Cj4gPiAgICAgICAgICAgICAgIGt2bS0+Y2ZnLmFyY2guY3B1X3R5cGUgPSBS
SVNDVl9fQ1BVX1RZUEVfTUFYOwo+ID4gLSAgICAgZWxzZQo+ID4gKyAgICAgfSBlbHNlIHsKPiA+
ICAgICAgICAgICAgICAga3ZtLT5jZmcuYXJjaC5jcHVfdHlwZSA9IFJJU0NWX19DUFVfVFlQRV9N
SU47Cj4gPgo+ID4gKyAgICAgICAgICAgICBzdHIgPSBhcmc7Cj4gPiArICAgICAgICAgICAgIHN0
ciArPSAzOwo+ID4gKyAgICAgICAgICAgICB3aGlsZSAoKnN0cikgewo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGlmICgqc3RyID09ICcsJykgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RyKys7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgbnN0ciA9IHN0cmNocihzdHIsICcsJyk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaWYg
KCFuc3RyKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnN0ciA9IHN0ciArIHN0
cmxlbihzdHIpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGxlbiA9IG5zdHIgLSBz
dHI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKGxlbikgewo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgX19taW5fZW5hYmxlKHN0ciwgbGVuKTsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0ciArPSBsZW47Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
fQo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICB9Cj4gPiArCj4gPiAgICAgICByZXR1cm4g
MDsKPiA+ICB9Cj4gPgo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KPgo+IE90aGVyd2lzZSwKPgo+IFJl
dmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgoKUmVnYXJk
cywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
