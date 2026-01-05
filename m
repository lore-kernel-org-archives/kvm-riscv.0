Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD23FC2A072
	for <kvm-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 04:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOGOhBhUyP7DngGmZpBbexjM1//BOsimEo1DXPhkOZw=; b=IddpgB6ouqAx5q
	PJby3noXwKUzbN7RW8XuajQkICJ2+P1U/EC5AsYpXjBwTZjbZA4G1vqTJspPTIYD/cg7ymdwlVxss
	blQe0T+PgrHrSH7PNDKs6FFnmZhdx7eIPAIyL6w9ejgx/7RVcpeyY6dDH+q7Jre5jcOyyzPwS+jUR
	44kY1KyatEIM1jD2eIkzdEr2FMAXL73+EwgK93Btd56mVw4ko86SObV9Ixlkk+VzsK6G8zZ+Dv1NZ
	+KNIWvzSHSvB1OFAt2e1FO/Fxb5qzHFamh4tmavaLjmfosqz80yIG0CMBTb36vqxBJfHkHy66LXB0
	yuqgXxRxJJU35LBT95ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccGG-0000000AhU7-2ZQo;
	Mon, 05 Jan 2026 04:32:08 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccGD-0000000AhRb-0BHJ
	for kvm-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 04:32:07 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-657523b5db0so2808842eaf.2
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Jan 2026 20:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767587524; x=1768192324; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHkaBZ4KK18wS8f7Porp98nIhGzHcidozMr5EBFYJqU=;
        b=pw/RnTBfZSVNpw15+IXspVuIsavIp399mCoICKOdMwExWpwsNOpxUXFkSoU1hP76Ce
         fRqfvyt2oklc4sE6eCmhHiB+dLRXlaHI4MRHSkicMeSQ4FSWamEWe2FbPajnJC7C/o9K
         iKfMln/9BTSbVzEgKwxvLweiMM2IAkzv4psGFU2auEj8v09LSLWkMhlOJcKJRjnSlhxu
         OjqRbJYFlver5dTSIdig29st8u4e/pfSyrogp/HstnN+hJzuGLC0k6NSU3A9PUQ79RTH
         kF1P2Zno92zAciGv0poozdpCP2PaE+/Isbr3w4pXAt7/FIjo/D32szJ/eit1SeIPig/T
         b1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767587524; x=1768192324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hHkaBZ4KK18wS8f7Porp98nIhGzHcidozMr5EBFYJqU=;
        b=S8JYUb0Px9QgoNmhvCE5scRTN6QuC9YJ2CHPzDhMaHkeoRyiRJFrd4+yESxhC5ZCGp
         /5lmLX/Rq+tQ2wmM3rCwJhPEQozxAN0eid204HdrPuOlqqqKdrNImuwCnqUDOFlACOcF
         juvYTMr9P0a4X/4vdrcieH2Mk4aCvE9nOR7pxMLKjkl5jCLBDGd8uoKDGuzyCI3kiW6Q
         eG0g8ZLrq7AU9bhD+KYF9uKu2TM7q7YqjhS5ETCLkAsFKBVaKGQaOk7W8j+lLjUWMeBJ
         0Ppo3iUNnz+IVNNJNZC/BZZNLPcXdvwC2TbsmDilR67dRzaYcX8oes6dMSas2FTO+gWO
         EwIg==
X-Forwarded-Encrypted: i=1; AJvYcCXMC+GCYP3nYdhnYCkC5aTl3pey9s2H1dDHzfp4+HY0ktvq7ruHLI/kjR6a99Emd3vnJG7ClFsjFBI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxPlUADgSbDIR0UA6kT7LDcX7Lky1KoO9U9I4SrvRGUlJtth4u
	wzgFJ82X31IXlChZrlh9SYq3VcUf2JxTsQS5K15I1qRzyJ826O1mi6Ncru1WPE/P2ETPPdoY5g1
	CTh9MIwM1eQzfx1aI6TudZPD+/MuxiLS2d1jGuYKlcg==
X-Gm-Gg: AY/fxX6A2msp+nYiekdR/emhS1NaVIpZzd40GuxZin9phAsh7CxhXDbxzmhP47HjhU8
	HyDo49Xqpfqtc/HJKA3gkMb177B7xrka0CmvbeAIeNRUyYLARcqcsJU0FDy7bsqq56mQxIYJPDA
	EYaM/3gfZkvQrkLWuXU/I74mVeZLx3iOCIRNUVfEXWSxbXzYlNuuicyba07UEb6Sr4tyUsugTne
	xzFNAaJjZ2260OQ/1GbEPl69f8x4EdD228oHsmeYiEQ3axC4g7XSLyqww0xMHYROKYDnd0DFWM8
	49knC5XZCpJgjhoKI1qNeos8iImzijQ8cutOKLb3WPCGM/a8ZquEu06j0Q==
X-Google-Smtp-Source: AGHT+IFTgEGwXPx6BKmlWZVg0kN84C+S2+KENgMMgK/TV+vTypAKt4mWKTS5e1BqvI7y/qNPjWol9HS75PcMvY2Cyfg=
X-Received: by 2002:a05:6820:1517:b0:65f:1038:1312 with SMTP id
 006d021491bc7-65f103814a5mr6928745eaf.24.1767587523833; Sun, 04 Jan 2026
 20:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20260104135938.524-1-naohiko.shimizu@gmail.com> <20260104135938.524-4-naohiko.shimizu@gmail.com>
In-Reply-To: <20260104135938.524-4-naohiko.shimizu@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Jan 2026 10:01:52 +0530
X-Gm-Features: AQt7F2q2sNhEFpoD1aMpeC7h9p1U_y0qvSfsQ2UQSOqUFOrIw4g5EvmP552X2Mw
Message-ID: <CAAhSdy0sLTudTUc9fXMXkjoyZkiiGk=HS_Ybgz_LT0E8-i5RJg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: suspend: Fix stimecmp update hazard on RV32
To: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	atish.patra@linux.dev, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_203205_094392_B817FD49 
X-CRM114-Status: GOOD (  18.21  )
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

T24gU3VuLCBKYW4gNCwgMjAyNiBhdCA3OjMw4oCvUE0gTmFvaGlrbyBTaGltaXp1CjxuYW9oaWtv
LnNoaW1penVAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFJWMzIsIHVwZGF0aW5nIHRoZSA2NC1i
aXQgc3RpbWVjbXAgKG9yIHZzdGltZWNtcCkgQ1NSIHJlcXVpcmVzIHR3bwo+IHNlcGFyYXRlIDMy
LWJpdCB3cml0ZXMuIEEgcmFjZSBjb25kaXRpb24gZXhpc3RzIGlmIHRoZSB0aW1lciB0cmlnZ2Vy
cwo+IGR1cmluZyB0aGVzZSB0d28gd3JpdGVzLgo+Cj4gVGhlIFJJU0MtViBQcml2aWxlZ2VkIFNw
ZWNpZmljYXRpb24gKGUuZy4sIFNlY3Rpb24gMy4yLjEgZm9yIG10aW1lY21wKQo+IHJlY29tbWVu
ZHMgYSBzcGVjaWZpYyAzLXN0ZXAgc2VxdWVuY2UgdG8gYXZvaWQgc3B1cmlvdXMgaW50ZXJydXB0
cwo+IHdoZW4gdXBkYXRpbmcgNjQtYml0IGNvbXBhcmlzb24gcmVnaXN0ZXJzIG9uIDMyLWJpdCBz
eXN0ZW1zOgo+Cj4gMS4gU2V0IHRoZSBsb3ctb3JkZXIgYml0cyAoc3RpbWVjbXApIHRvIGFsbCBv
bmVzIChVTE9OR19NQVgpLgo+IDIuIFNldCB0aGUgaGlnaC1vcmRlciBiaXRzIChzdGltZWNtcGgp
IHRvIHRoZSBkZXNpcmVkIHZhbHVlLgo+IDMuIFNldCB0aGUgbG93LW9yZGVyIGJpdHMgKHN0aW1l
Y21wKSB0byB0aGUgZGVzaXJlZCB2YWx1ZS4KPgo+IEN1cnJlbnQgaW1wbGVtZW50YXRpb24gd3Jp
dGVzIHRoZSBMU0IgZmlyc3Qgd2l0aG91dCBlbnN1cmluZyBhIGZ1dHVyZQo+IHZhbHVlLCB3aGlj
aCBtYXkgbGVhZCB0byBhIHRyYW5zaWVudCBzdGF0ZSB3aGVyZSB0aGUgNjQtYml0IGNvbXBhcmlz
b24KPiBpcyBpbmNvcnJlY3RseSBldmFsdWF0ZWQgYXMgImV4cGlyZWQiIGJ5IHRoZSBoYXJkd2Fy
ZS4gVGhpcyByZXN1bHRzIGluCj4gc3B1cmlvdXMgdGltZXIgaW50ZXJydXB0cy4KPgo+IFRoaXMg
cGF0Y2ggYWRvcHRzIHRoZSBzcGVjLXJlY29tbWVuZGVkIDMtc3RlcCBzZXF1ZW5jZSB0byBlbnN1
cmUgdGhlCj4gaW50ZXJtZWRpYXRlIDY0LWJpdCBzdGF0ZSBpcyBuZXZlciBzbWFsbGVyIHRoYW4g
dGhlIGN1cnJlbnQgdGltZS4KPgo+IEZpeGVzOiBmZmVmNTRhZDQxMTAgKCJyaXNjdjogQWRkIHN0
aW1lY21wIHNhdmUgYW5kIHJlc3RvcmUiKQo+IFNpZ25lZC1vZmYtYnk6IE5hb2hpa28gU2hpbWl6
dSA8bmFvaGlrby5zaGltaXp1QGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvc3VzcGVuZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5jCj4gaW5kZXggMjRiM2Y1
N2Q0NjdmLi5hZmY5MzA5MGM0ZWYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3Vz
cGVuZC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5jCj4gQEAgLTUxLDEwICs1
MSwxMSBAQCB2b2lkIHN1c3BlbmRfcmVzdG9yZV9jc3JzKHN0cnVjdCBzdXNwZW5kX2NvbnRleHQg
KmNvbnRleHQpCj4KPiAgI2lmZGVmIENPTkZJR19NTVUKPiAgICAgICAgIGlmIChyaXNjdl9oYXNf
ZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRfU1NUQykpIHsKPiAtICAgICAgICAgICAg
ICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUCwgY29udGV4dC0+c3RpbWVjbXApOwo+ICAjaWYgX19y
aXNjdl94bGVuIDwgNjQKPiArICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUCwg
VUxPTkdfTUFYKTsKPiAgICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUEgsIGNv
bnRleHQtPnN0aW1lY21waCk7Cj4gICNlbmRpZgo+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUo
Q1NSX1NUSU1FQ01QLCBjb250ZXh0LT5zdGltZWNtcCk7Cj4gICAgICAgICB9Cj4KPiAgICAgICAg
IGNzcl93cml0ZShDU1JfU0FUUCwgY29udGV4dC0+c2F0cCk7Cj4gLS0KPiAyLjM5LjUKPgoKLS0g
Cmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
