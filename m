Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A783C2A06C
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbxszxnN5gnNdU6tLGw6cFUzf843CO1Lai1Q3clrT00=; b=Q+F1bYZid6U9xO
	lXNBvnNOcdKIck9c1bhYn+mEhN1fqyAnH/jd4QdvvzFy+7ul+JnGZQOYiOy9eP/dP+w+ui5N74NXt
	+v/X0WnZ7Y5QPd0WIHeoKTdrvrQvcgThwIJj7594aYULADFvGaFtYMj1xvZFMPc+4VUGCKbBGdxZb
	YMElVDjPY5/2umiRBdgbtQ+eLMZDUIKtXmUCwQslh1sIlJ52bXgDRylSCMvOd8dK5YGgBA2GZBYaN
	j2o5LipzfIBk64dM0PnUJvRuW37DcDcTCDc484+TFu2UdpfHYFB8M4W5BQ9cMSiBmfvznyqC8rLn1
	oqRZ7jQbzoWh6r0bnd+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcNs6-0000000AFH0-3JO1;
	Sun, 04 Jan 2026 13:10:14 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcNs4-0000000AFGI-1Wmf
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 13:10:13 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-3ec96ee3dabso10472505fac.1
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Jan 2026 05:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767532211; x=1768137011; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTI7TMS20QjRHAXZJ9bbtMAI7NpsUCUKEERUcBbxFDM=;
        b=0O0ch2kLiK4wIXF0pnTThfzVClSe+IB9w9OIdVwqht5tKuVEQSH4b34Rw8d9dNW6rr
         O8GnAr0+ERTxAo7Bct/wGmopb9jV7oqu/NzvDUS8PGjgCu6xNNB4eXcfNmEfEr3+kS4k
         vntaVx2iuEk237BqpNR/xxy2Oihif5NktdldBGY07uX0lkJq09rVW62ELDwLSr5n6Mcx
         EEIj/LExhCw/1vzJc9vY+tqfK+4vA9KLF1ge5UDT2WUNxpKj/Vi48x+Gdfibk2AZVDZR
         Td45DNazR23XhdKBk7623Ib3hKJE43F4y+2B5GgGcs42obwoZslTfr4SrxcG+z5vjRYr
         K0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767532211; x=1768137011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LTI7TMS20QjRHAXZJ9bbtMAI7NpsUCUKEERUcBbxFDM=;
        b=oYwP+MkyzOWF7Kmx3eTw99l0kyFhGkdOrMtLVG1uxXwIPQTok/Tj8PSlLZ6aErFZKB
         VVUXTzq6FVsLgSNAzAMt43aah3KFLLva+mUNOE1WbxTZVpER9KAZpxFYgoHTI+ey2aJ9
         XBHHAFjSe9Vtzpfm8hyWkXE20cJbAdu/pxDFMuDCvaL28nEVYxRVgIMCk/5shsCMjDdj
         HaLKgj+2guCvAKX/L0PjTVCO759DSc1idQaGc63CfJW7fRYJkFn3SZzIQfolgc9w6sp4
         YARKpB6nO6rZIJS4WAQ0T48vgOdDjTZCvIf7ntYX4dBSJutTFZSZubm7rkL9/K7B/sds
         yQ7A==
X-Forwarded-Encrypted: i=1; AJvYcCWPBAelSL2bOajX17cktAi2vvIn7L4FN/OT77tJfu/swHuQVlGQYnlkd2RLZPW/3MUaLa+VZWEuQQ4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjhgOLLyDX9T6VodImLBQcsnFP9dYbRjTYm4l7LU+CtlJGDr0O
	x/Lg/bUhRhg2T2PHm0/veCIncz005IDp+2TzS0b2iY7vHfmhj+I1uZvaMaaiTm7v8Eu3ISFT6Y5
	HhKlqB5G6Z93YaXn1kNz1T9Js4gtUybLjvYlhpXjtsg==
X-Gm-Gg: AY/fxX5FXJzcIoo6huuIeaokTJsls6h9wmUxkftb/mbh4E3yOq/eNIrffxiQkZzqaTP
	JN/73a/xpM/lI1OeYQkluljSkWaYfgYo64FVUHDesqlUZgHNF4v7GP8N0xKb93aa8Gp2yErTLGy
	Mz45Nf6yfLdCzE7fUFhAmYaqP8C2lV6JcakpY5P5+by6SoYfaGClbokampw2IlM/ipZvYFd7c3c
	3Ap1oLUgZ0HMcBcPA1oCf1UCS5FzE27F+N6CEPcWdSX5RaHolgeqEtVEHN22OhZb7PoN+//RTla
	wS/jaWknVF7kPbADdwNOxyy0LdZVB6sy8dPMVq+DYa1YMitg4gP0R2rCFw==
X-Google-Smtp-Source: AGHT+IE3xDi6i40mJyQzdIdSqb0qTJtsVm5MzXMVUO8Fr9GrH5N6OhzSxOH6UG8kwIyyXxEmLzYaQhs3RjFu22Jg0rU=
X-Received: by 2002:a05:6820:c004:b0:659:9a49:8f9c with SMTP id
 006d021491bc7-65d0ea4762emr13042068eaf.21.1767532210832; Sun, 04 Jan 2026
 05:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20260103152400.552-1-naohiko.shimizu@gmail.com> <20260103152400.552-2-naohiko.shimizu@gmail.com>
In-Reply-To: <20260103152400.552-2-naohiko.shimizu@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 4 Jan 2026 18:39:59 +0530
X-Gm-Features: AQt7F2pSg9HuUMgDzNHCV2MnkSXVSFXAakgKYkF8cMM6-UVu47ouVvHzBZEBtZE
Message-ID: <CAAhSdy1soLCbDW43otanoiXRSpx25eVSORXjaWk-oDKC7Bejsw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
To: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	atish.patra@linux.dev, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_051012_402891_C8E42348 
X-CRM114-Status: GOOD (  17.91  )
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

T24gU2F0LCBKYW4gMywgMjAyNiBhdCA4OjU04oCvUE0gTmFvaGlrbyBTaGltaXp1CjxuYW9oaWtv
LnNoaW1penVAZ21haWwuY29tPiB3cm90ZToKPgo+IFNpZ25lZC1vZmYtYnk6IE5hb2hpa28gU2hp
bWl6dSA8bmFvaGlrby5zaGltaXp1QGdtYWlsLmNvbT4KPgo+IHJpc2N2OiBmaXggdGltZXIgcmVn
aXN0ZXIgdXBkYXRlIGhhemFyZCBvbiBSVjMyCgpEcm9wIHRoaXMgbGluZSBzaW5jZSBpdCBsb29r
IHNpbWlsYXIgdG8gcGF0Y2ggc3ViamVjdC4KCj4KPiBPbiBSVjMyLCB1cGRhdGluZyB0aGUgNjQt
Yml0IHN0aW1lY21wIChvciB2c3RpbWVjbXApIENTUiByZXF1aXJlcyB0d28KPiBzZXBhcmF0ZSAz
Mi1iaXQgd3JpdGVzLiBBIHJhY2UgY29uZGl0aW9uIGV4aXN0cyBpZiB0aGUgdGltZXIgdHJpZ2dl
cnMKPiBkdXJpbmcgdGhlc2UgdHdvIHdyaXRlcy4KPgo+IFRoZSBSSVNDLVYgUHJpdmlsZWdlZCBT
cGVjaWZpY2F0aW9uIChlLmcuLCBTZWN0aW9uIDMuMi4xIGZvciBtdGltZWNtcCkKPiByZWNvbW1l
bmRzIGEgc3BlY2lmaWMgMy1zdGVwIHNlcXVlbmNlIHRvIGF2b2lkIHNwdXJpb3VzIGludGVycnVw
dHMKPiB3aGVuIHVwZGF0aW5nIDY0LWJpdCBjb21wYXJpc29uIHJlZ2lzdGVycyBvbiAzMi1iaXQg
c3lzdGVtczoKPgo+IDEuIFNldCB0aGUgbG93LW9yZGVyIGJpdHMgKHN0aW1lY21wKSB0byBhbGwg
b25lcyAoVUxPTkdfTUFYKS4KPiAyLiBTZXQgdGhlIGhpZ2gtb3JkZXIgYml0cyAoc3RpbWVjbXBo
KSB0byB0aGUgZGVzaXJlZCB2YWx1ZS4KPiAzLiBTZXQgdGhlIGxvdy1vcmRlciBiaXRzIChzdGlt
ZWNtcCkgdG8gdGhlIGRlc2lyZWQgdmFsdWUuCj4KPiBDdXJyZW50IGltcGxlbWVudGF0aW9uIHdy
aXRlcyB0aGUgTFNCIGZpcnN0IHdpdGhvdXQgZW5zdXJpbmcgYSBmdXR1cmUKPiB2YWx1ZSwgd2hp
Y2ggbWF5IGxlYWQgdG8gYSB0cmFuc2llbnQgc3RhdGUgd2hlcmUgdGhlIDY0LWJpdCBjb21wYXJp
c29uCj4gaXMgaW5jb3JyZWN0bHkgZXZhbHVhdGVkIGFzICJleHBpcmVkIiBieSB0aGUgaGFyZHdh
cmUuIFRoaXMgcmVzdWx0cyBpbgo+IHNwdXJpb3VzIHRpbWVyIGludGVycnVwdHMuCj4KPiBUaGlz
IHBhdGNoIGFkb3B0cyB0aGUgc3BlYy1yZWNvbW1lbmRlZCAzLXN0ZXAgc2VxdWVuY2UgdG8gZW5z
dXJlIHRoZQo+IGludGVybWVkaWF0ZSA2NC1iaXQgc3RhdGUgaXMgbmV2ZXIgc21hbGxlciB0aGFu
IHRoZSBjdXJyZW50IHRpbWUuCgpOZWVkIFNpZ25lZC1vZmYtYnkgYW5kIEZpeGVzIHRhZyBvdmVy
IGhlcmUgaW4gYWxsIHRocmVlIHBhdGNoZXMuCgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBkcml2
ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
bG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNj
di5jCj4gaW5kZXggNGQ3Y2YzMzg4MjRhLi5jZmM0ZDgzYzQyYzAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJj
ZS90aW1lci1yaXNjdi5jCj4gQEAgLTUwLDggKzUwLDkgQEAgc3RhdGljIGludCByaXNjdl9jbG9j
a19uZXh0X2V2ZW50KHVuc2lnbmVkIGxvbmcgZGVsdGEsCj4KPiAgICAgICAgIGlmIChzdGF0aWNf
YnJhbmNoX2xpa2VseSgmcmlzY3Zfc3N0Y19hdmFpbGFibGUpKSB7Cj4gICNpZiBkZWZpbmVkKENP
TkZJR18zMkJJVCkKPiAtICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUCwgbmV4
dF90dmFsICYgMHhGRkZGRkZGRik7Cj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJ
TUVDTVAsIFVMT05HX01BWCk7Cj4gICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVD
TVBILCBuZXh0X3R2YWwgPj4gMzIpOwo+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NU
SU1FQ01QLCBuZXh0X3R2YWwgJiAweEZGRkZGRkZGKTsKPiAgI2Vsc2UKPiAgICAgICAgICAgICAg
ICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUCwgbmV4dF90dmFsKTsKPiAgI2VuZGlmCj4gLS0KPiAy
LjM5LjUKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
