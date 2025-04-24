Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B413C369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 13:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=flCTuBcshAqDi2717dGSjKnTZwDpImUl0B15Y0hcuQ8=; b=f5JqNhBxIAQfEj
	r9YeFqK3fRBn39cCGsom/5P3ujhiZfRw7ciwWn510pnu6VY2ayiD+TBkHZh1NpMrDwLeAR63iepJ3
	eFdtxkSKd+A43Q98oEQUgZmmj75GQoHgyb4RGJSmBZa9DpPqZrMSGBqBQ8hApA1XLq51AwHewNb0p
	efPebWBQG9BpC01xkvDF3f+QysiVY2y8aIitiQfO5Jo0WB08ikORiOwR5SWytRlYiyO+ERw9VRNcl
	4tI6lnfybFrdamrd9EGXhiQshUzGkXw3LblRLEbgNiFipsn364rTT18HEN02bhcTdJTABIARVS1Ba
	MPppGAWT9zuaYc0DuLyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wzA-0000000EGVU-2tQ1;
	Thu, 24 Apr 2025 13:51:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7weF-0000000EBVy-2Gzt
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 13:29:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43ede096d73so7717955e9.2
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 06:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745501390; x=1746106190; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7j9NUEt/ncZz1epZplQ8DSs1gFnYZwmEmPsf7e7ffgk=;
        b=IlxeFqsFez/2hhH8nyZkowC0qZdFSznlLoaaI0RRVEJ8iJ7Iihggla4byEkZ6Ho1e+
         tgCNlr4o9vRt9Hjy1C43IPjhSZLr0gLoz2DJe5ZWKFrb44yYpfAbHj8poeKdi/fgRp+F
         E5QoaoGqL+C5eF/kLr3v1PTXyzAKoP1/HXJHvq4rfJ6qaDGb6hZK9PZ0UBYeW4fYTgya
         2qe0LBIZgA2zn0UBfn5kmEBusLFKzjz7fT9lzU8rbJGi19RKq0W22IfE9fcW94P6DdXD
         Umwa5sw6iraz9DgtozmGAEGpRFESsh/JZhE1vsEBwABBR9stscSpEJunkzuDIhh4LT0j
         +Ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745501390; x=1746106190;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7j9NUEt/ncZz1epZplQ8DSs1gFnYZwmEmPsf7e7ffgk=;
        b=nKWM/3Wb2Vioyy4/j0e58S2bS+lISso9DMYxR9redKq/0d7OA4uSaw+Ul7bFyk2ca+
         MZ/mo30JolLvp7mkluyoU3IuVMBFqI/cqCQV9hy4HevPcIiykac3h7g+pBi8nCBnQ8wC
         KKMn3tZPV/NfkZC1D0OQh1hn3TlpKMbVDsNP3JWHU+d/SmBcwlo5uuJ2wsZ4BG46aLGn
         I+QfmUt997VDBZ1s6KzkmFUiHG4nmG0fqJe3MDovsqC20vu3W/VTR9XBDRxEJBmBK7sL
         Ysni4PDQdF+/TqjU9TFM9n2vkBXp4JDEvETCIhv8jpiTS7fZ/ptdZNB5aBkuGgOMuOAr
         5A9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtqwdgcop/u9yoSFDX/fAgIoIf2phAddH5w/h+2ZC5CcJ2j7N0Bg6vvjwUcFtVYWZ3qp/5nT8swX8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMokaJhiso1nYzyDItV/3LKaH0m5IeWxTuv4KFxnI6A6Y5Y/6D
	bi5vMwpdsH75GjLIsGqotHojeFneO+qU7EB+ZAypgotoe/+vG1gBcF+LaAH3jps=
X-Gm-Gg: ASbGncuU3AY0Vm1cC691dcb4ZynGErmIon3v3fEs+m+pHafve9YUyD8NbakkCxwwiha
	HZi3sjH+RAOpcJFW/7IBhHTNOzFrNkFhvZX2XjCJ1AZH7Df1FCI2W2n4Wn3MYQ7zTFNqANL+IFl
	2GMH+7/L6bNV/2BPztE4/sh35i6TmkVsxagI6yYwjYpoVNaRTgmAcv8CWublD3KuSJFS2TNNhLD
	Ktr6zz245tTMuakKG7cAeQsN0jm4IX87yziUUau55lSEwHAuxctmGFlt2NE4ZccwGX3La1nZ+X5
	8ds3LwmEig/gHxjtNnwqlGLFHUql
X-Google-Smtp-Source: AGHT+IHUUy7DAq8FdoTctbIZq+7IJFz8qCxQ/okI9KIsoeBuVJ0XGVtGE1TDEgi74UaQzCLfqt/vbg==
X-Received: by 2002:a05:600c:5007:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-4409bda56c9mr25014155e9.33.1745501389811;
        Thu, 24 Apr 2025 06:29:49 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2aab65sm20962525e9.17.2025.04.24.06.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:29:49 -0700 (PDT)
Date: Thu, 24 Apr 2025 15:29:48 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, 
	maz@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [kvmtool PATCH 09/10] riscv: Add cpu-type command-line option
Message-ID: <20250424-6f042bf5e7c2433d9df6cd11@orel>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
 <20250326065644.73765-10-apatel@ventanamicro.com>
 <20250412-6eb18b693df1bd8959bcdfc6@orel>
 <CAK9=C2XD2Zk98KJrPYqseVQO-m_tFA97r=eXb2XXJ10vpxuk=A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2XD2Zk98KJrPYqseVQO-m_tFA97r=eXb2XXJ10vpxuk=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_062951_579589_2973FCFF 
X-CRM114-Status: GOOD (  34.11  )
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMDY6Mjc6MzVQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBTYXQsIEFwciAxMiwgMjAyNSBhdCA2OjQ14oCvUE0gQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBNYXIgMjYsIDIwMjUg
YXQgMTI6MjY6NDNQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKLi4uCj4gPiA+ICsgICAgICAg
ICAhaW5mby0+bWluX2NwdV9pbmNsdWRlZCkKPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gdHJ1
ZTsKPiA+Cj4gPiBJZiAnbWluX2NwdV9pbmNsdWRlZCcgKG9yICdtaW5fZW5hYmxlZCcpIGlzIGFs
bCB3ZSBwbGFuIHRvIGNoZWNrIGZvcgo+ID4gd2hldGhlciBvciBub3QgYW4gZXh0ZW5zaW9uIGlz
IGVuYWJsZWQgZm9yIHRoZSAnbWluJyBjcHUgdHlwZSwgdGhlbgo+ID4gd2Ugc2hvdWxkIHdyaXRl
IHRoaXMgYXMKPiA+Cj4gPiAgaWYgKCFzdHJjbXAoa3ZtLT5jZmcuYXJjaC5jcHVfdHlwZSwgIm1p
biIpKQo+ID4gICAgIHJldHVybiAhaW5mby0+bWluX2VuYWJsZWQ7Cj4gPgo+ID4gT3RoZXJ3aXNl
IHdoZW4gbWluX2VuYWJsZWQgaXMgdHJ1ZSB3ZSdkIHN0aWxsIGNoZWNrCj4gPiBrdm0tPmNmZy5h
cmNoLmV4dF9kaXNhYmxlZFtpbmZvLT5leHRfaWRdLgo+IAo+IFRoZSBleHRlbnNpb25zIHBhcnQg
b2YgIm1pbiIgY3B1X3R5cGUgY2FuIGJlIGRpc2FibGVkIHVzaW5nCj4gIi0tZGlzYWJsZS14eXoi
IGNvbW1hbmQtbGluZSBvcHRpb25zIGhlbmNlIHRoZSBjdXJyZW50IGFwcHJvYWNoLgo+IAoKU2hv
dWxkbid0IHdlIGp1c3QgaGF2ZSBhIHNpbmdsZSBwbGFjZSB0byBjaGVjaz8gT3RoZXJ3aXNlIHNv
bWV0aGluZyBsaWtlCnRoaXMgbWF5IG5vdCB3b3JrIHRoZSB3YXkgdGhlIHVzZXIgZXhwZWN0cwoK
ICAtY3B1IG1pbix4eXogLS1kaXNhYmxlLXh5egoKU29tZXRoaW5nIGxpa2UgdGhhdCBtYWtlcyBz
ZW5zZSBpZiB5b3UgaGF2ZSBhIHJ1bmt2bSBzY3JpcHQgbGlrZSB0aGlzCgogICMhL2Jpbi9iYXNo
CiAgQkFTRV9DUFU9bWluLHh5egogIGxrdm0gLi4uIC1jcHUgJEJBU0VfQ1BVICRACgphbmQgdGhl
biB5b3UgaW52b2tlIGl0IHdpdGgKCiAgcnVua3ZtIC0tZGlzYWJsZS14eXoKCj4gPiA+ICAgICAg
IGJvb2wgICAgICAgICAgICBzYmlfZXh0X2Rpc2FibGVkW0tWTV9SSVNDVl9TQklfRVhUX01BWF07
Cj4gPiA+ICB9Owo+ID4gPgo+ID4gPiAraW50IHJpc2N2X19jcHVfdHlwZV9wYXJzZXIoY29uc3Qg
c3RydWN0IG9wdGlvbiAqb3B0LCBjb25zdCBjaGFyICphcmcsIGludCB1bnNldCk7Cj4gPiA+ICsK
PiA+ID4gICNkZWZpbmUgT1BUX0FSQ0hfUlVOKHBmeCwgY2ZnKSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiAgICAgICBwZngsICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiAr
ICAgICBPUFRfQ0FMTEJBQ0soJ1wwJywgImNwdS10eXBlIiwga3ZtLCAibWluIG9yIG1heCIsICAg
ICAgICAgICAgICAgXAo+ID4gPiArICAgICAgICAgICAgICAgICAgIkNob29zZSB0aGUgY3B1IHR5
cGUgKGRlZmF1bHQgaXMgbWF4KS4iLCByaXNjdl9fY3B1X3R5cGVfcGFyc2VyLCBrdm0pLFwKPiA+
Cj4gPiBJIGhhZCB0byBsb29rIGFoZWFkIGF0IHRoZSBuZXh0IHBhdGNoIHRvIHVuZGVyc3RhbmQg
d2h5IHdlJ3JlIHNldHRpbmcga3ZtCj4gPiBhcyB0aGUgb3B0IHBvaW50ZXIgaGVyZS4gSSB0aGlu
ayBpdCBzaG91bGQgYmUgYWRkZWQgaW4gdGhlIG5leHQgcGF0Y2gKPiA+IHdoZXJlIGl0J3MgdXNl
ZC4gQWxzbywgd2UgZG9uJ3QgdXNlIG9wdC0+dmFsdWUgc28gd2UgY25hIHNldCB0aGF0IHRvIE5V
TEwuCj4gCj4gV2UgYXJlIGluZGVlZCB1c2luZyBvcHQtPnB0ciBpbiB0aGlzIHBhdGNoIHNvIHdl
IHNob3VsZCBiZSBwYXNzaW5nCj4ga3ZtIGFzIG9wdC1wdHIuCgpPaCB5ZWFoLCBJIHNlZSB0aGF0
IG5vdy4KCj4gPiA+IGRpZmYgLS1naXQgYS9yaXNjdi9rdm0uYyBiL3Jpc2N2L2t2bS5jCj4gPiA+
IGluZGV4IDFkNDk0NzkuLjZhMWIxNTQgMTAwNjQ0Cj4gPiA+IC0tLSBhL3Jpc2N2L2t2bS5jCj4g
PiA+ICsrKyBiL3Jpc2N2L2t2bS5jCj4gPiA+IEBAIC0yMCw2ICsyMCw4IEBAIHU2NCBrdm1fX2Fy
Y2hfZGVmYXVsdF9yYW1fYWRkcmVzcyh2b2lkKQo+ID4gPgo+ID4gPiAgdm9pZCBrdm1fX2FyY2hf
dmFsaWRhdGVfY2ZnKHN0cnVjdCBrdm0gKmt2bSkKPiA+ID4gIHsKPiA+ID4gKyAgICAgaWYgKCFr
dm0tPmNmZy5hcmNoLmNwdV90eXBlKQo+ID4gPiArICAgICAgICAgICAgIGt2bS0+Y2ZnLmFyY2gu
Y3B1X3R5cGUgPSAibWF4IjsKPiA+ID4gIH0KPiA+Cj4gPiBIbW0sIHNlZW1zIGxpa2Ugd2UncmUg
bWlzc2luZyB0aGUgcmlnaHQgcGxhY2UgZm9yIHRoaXMuIEEgdmFsaWRhdGUKPiA+IGZ1bmN0aW9u
IHNob3Vsbid0IGJlIHNldHRpbmcgZGVmYXVsdHMuIEkgdGhpbmsgd2Ugc2hvdWxkIHJlbmFtZQo+
ID4ga3ZtX19hcmNoX2RlZmF1bHRfcmFtX2FkZHJlc3MoKSB0bwo+ID4KPiA+ICAgdm9pZCBrdm1f
X2FyY2hfc2V0X2RlZmF1bHRzKHN0cnVjdCBrdm1fY29uZmlnICpjZmcpCj4gPgo+ID4gYW5kIHNl
dCBjZmctPnJhbV9hZGRyIGluc2lkZSBpdC4gVGhlbiBhZGQgdGhlIGNwdV90eXBlIGRlZmF1bHQK
PiA+IHNldHRpbmcgdG8gcmlzY3YncyBpbXBsLgo+IAo+IFJlbmFtaW5nIGt2bV9fYXJjaF9kZWZh
dWx0X3JhbV9hZGRyZXNzKCkgaXMgY2VydGFpbmx5IG5vdAo+IHRoZSByaWdodCB3YXkgYmVjYXVz
ZSBpdCBoYXMgdG8gYmUgZG9uZSBhZnRlciBwYXJzaW5nIG9wdGlvbnMKPiBzbyB0aGF0IHdlIHNl
dCB0aGUgZGVmYXVsdCB2YWx1ZSBvZiBjcHVfdHlwZSBvbmx5IGlmIGl0IGlzIG5vdAo+IHNldCBi
eSBjb21tYW5kLWxpbmUgb3B0aW9ucy4gRHVlIHRvIHRoaXMgcmVhc29uLCB0aGUKPiBrdm1fX2Fy
Y2hfdmFsaWRhdGVfY2ZnKCkgaXMgdGhlIGJlc3QgcGxhY2UgdG8gc2V0IGRlZmF1bHQKPiB2YWx1
ZSBvZiBjcHVfdHlwZS4KCkNhbid0IHdlIGp1c3QgdW5jb25kaXRpb25hbGx5IHNldCBrdm0tPmNm
Zy5hcmNoLmNwdV90eXBlIHRvICJtYXgiIGluCmt2bV9fYXJjaF9zZXRfZGVmYXVsdHMoKSBhbmQg
dGhlbiBpZiB0aGUgY29tbWFuZCBsaW5lIHBhcnNpbmcgZGV0ZXJtaW5lcwppdCBzaG91bGQgYmUg
b3ZlcnJpZGRlbiBpdCBnZXRzIHJlYXNzaWduZWQ/CgpBY3R1YWxseSwgZG9lcyBjcHVfdHlwZSBu
ZWVkIHRvIGJlIGEgc3RyaW5nPyBJZiB3ZSB1c2UgYW4gZW51bSBmb3IgaXQKd2UgY291bGQgc2F2
ZSBvdXJzZWx2ZXMgc29tZSBvZiB0aGUgc3RyY21wIHBhaW4uCgpUaGFua3MsCmRyZXcKCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
