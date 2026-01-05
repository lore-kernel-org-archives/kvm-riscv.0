Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57859C2A072
	for <kvm-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 04:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZ2S2XrOA85TVYOmiRBpvPL35yuV1uK/7HZk/9qoqbc=; b=1bPHYwwVHVrzUf
	5qRniDcpQg3PvkAsfWHEAmwfEe7vTW5tz2YP3M5xs0MBR9vzmf8lv8V0EwxeV6EERodF3Y7jk1qM+
	6RBvYOR1hUFAp2ivI2voDIr5j/2NRCTQDy1WAgRg5LgGXgKHfAY9Ndcl5Eqf7rcVAkCNOdNULMHme
	tBFu1u8DHFuDqciPevaLXRCiTOdirktK0DsNi3zZR2P3Ly/WOw0qpc0FgkhZvO9Gvl/eBhNIVBHVR
	T6mBqFrcseo1oyjdtHMRQBDdyNbuX5hNGTaasomkZivA0EdgfbTOWNlAU98ks4lfBHMErIV/rHKPL
	S04zvZ76VO/woHiXJqrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccFu-0000000AhNP-44Cz;
	Mon, 05 Jan 2026 04:31:46 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccFs-0000000AhM9-0KW7
	for kvm-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 04:31:45 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-3ece54945d9so4818303fac.0
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Jan 2026 20:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767587503; x=1768192303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRQ6OMDCoS/pT3RqkzNsASYNjnvWbDr+adtHT2Vjro0=;
        b=h7qZKAzXwk48+MVp1eObmugA3MI6kgL7SEc70czyZR2ogaPaqa77tvcGBg3KnROssW
         cXtFsWzog9cjZRxr3gdsqWmGjl3wWn5ATDZnoKSul9oFqAXkAOkLd/xgskqXhAllX7MY
         ReC5gyYSbyQQWdOGQn8zl18u2TGEDKmGnn5e5b/3xkEm9R7wXmalCITHjNVddj9xWPYd
         Nkcx86a4nEYB93KI+vtTSGC+S/MpnWhgNc8XuEIvZXSOjQfcmMg8HwyxxG6+vkxhlJbS
         HluUswqvoZriPT1osI07J0+ClwqND4CuT+fykn56Dz0nkz4A9F48rRUjXy6RJVr1i9dR
         Fkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767587503; x=1768192303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VRQ6OMDCoS/pT3RqkzNsASYNjnvWbDr+adtHT2Vjro0=;
        b=SvoaoaGZrdWqesYTicEquJknJHK0BYJhj7zJsbUQqiYezeItYxn514wiODje0aVS2H
         e7w+xqcSu/3uI6piymzhDzSsu3ciXtuu4XU9KyWi0m8jx4Y6k4JMcY/pwSwMC1sHEL4J
         /+8Rmy39H97KBc9t7/TxAU8l/jDOCyX4h6OP0szRA4FF+zxwnw8S4fkToI3HLUu0U0Tk
         h46wC3KeepSMdp+zLYbr151Zd1iF7iCUDBBaAIUggvEvmfCgblJ75+w2y8+acNlCD33C
         V5dpCe7qv6lLifxLe8QnNfUKF9hPDG5igXNgl3xA1MM7ut9nj42v6CBKjR+gMfh9CQHk
         NLuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoRNc3YEkPeloAmZrz56Zat3y210/SY+eA7wkmh5m8So0xuBxnhqhRJO3vVNBnfuh7+OzkSS9o6t4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGgxruJiB38kHj06eb8KOS/bj9vOF3LR8Wo5OIzl6xDBUwZCs7
	ROTOb2wydeB4vPS6FJi8WKxPnfWCVDIwZBGzSFbIQzSb0in+HWrLUcf2xaiDCV/7yxjIE+4cMkv
	N8cZKcTX3xoU8Ft2FTIclZDwUlPASkdyBwJZAxCzLcw==
X-Gm-Gg: AY/fxX5GjpwkIJGP+wgbmvaD5x/3oTwUTjdQL77v1LhAwUTTUacg8zwhKoOLvDtq+E6
	0YGKlrhDxHNs3Q+DhXtawynXYJqpV/s5AAer2ncwNdpjRmEVQDrcSPgMGG6va+TWfGo2UjkRq/J
	ts9g3R4kEmEYoVp+/c8+BDKittjpTIDqIS4twJnqASgqrxsNI/1l/T/xfwHYhznPa0dnpEraRxA
	PFdzVl7uXfekL0SGBgPcgKTEGNUbmDZj2oJAGQ0CUsa+yYzOAseV4qwrfpon/XiU6kzYKibaIhW
	09sYEab3AiLI+i5z7hQVdjQzVPy1Gm5JvrxMFfHoPkdC7T6v3pxAIKaYhA==
X-Google-Smtp-Source: AGHT+IHcKT2JR0dERW1P8mzF5izxKZvyKkjogtNi5lVp6Ef+d3be2ZXscFhYZUS/uEVX0ylkADDomixyPLXoChTBifY=
X-Received: by 2002:a05:6820:6e86:b0:65b:250c:70f0 with SMTP id
 006d021491bc7-65d0eb1f930mr13041234eaf.47.1767587503009; Sun, 04 Jan 2026
 20:31:43 -0800 (PST)
MIME-Version: 1.0
References: <20260104135938.524-1-naohiko.shimizu@gmail.com> <20260104135938.524-2-naohiko.shimizu@gmail.com>
In-Reply-To: <20260104135938.524-2-naohiko.shimizu@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Jan 2026 10:01:32 +0530
X-Gm-Features: AQt7F2rYFXOkOqEixAKm3k9vFsmCv4F946k8w_SRew9TUmb4ul4n5jrOgjW2BRc
Message-ID: <CAAhSdy2dZ0neWZMyT=-b01kwAJ5XSTiBfifuqtSJ5OzvkbVOeQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
To: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	atish.patra@linux.dev, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_203144_134035_19D95544 
X-CRM114-Status: GOOD (  17.87  )
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
dGhlIGN1cnJlbnQgdGltZS4KPgo+IEZpeGVzOiA5ZjdhOGZmNjM5MWYgKCJSSVNDLVY6IFByZWZl
ciBzc3RjIGV4dGVuc2lvbiBpZiBhdmFpbGFibGUiKQo+IFNpZ25lZC1vZmYtYnk6IE5hb2hpa28g
U2hpbWl6dSA8bmFvaGlrby5zaGltaXp1QGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTog
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCgo+IC0tLQo+
ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgfCAzICsrLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1l
ci1yaXNjdi5jCj4gaW5kZXggNGQ3Y2YzMzg4MjRhLi5jZmM0ZDgzYzQyYzAgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gKysrIGIvZHJpdmVycy9jbG9j
a3NvdXJjZS90aW1lci1yaXNjdi5jCj4gQEAgLTUwLDggKzUwLDkgQEAgc3RhdGljIGludCByaXNj
dl9jbG9ja19uZXh0X2V2ZW50KHVuc2lnbmVkIGxvbmcgZGVsdGEsCj4KPiAgICAgICAgIGlmIChz
dGF0aWNfYnJhbmNoX2xpa2VseSgmcmlzY3Zfc3N0Y19hdmFpbGFibGUpKSB7Cj4gICNpZiBkZWZp
bmVkKENPTkZJR18zMkJJVCkKPiAtICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNN
UCwgbmV4dF90dmFsICYgMHhGRkZGRkZGRik7Cj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShD
U1JfU1RJTUVDTVAsIFVMT05HX01BWCk7Cj4gICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1Jf
U1RJTUVDTVBILCBuZXh0X3R2YWwgPj4gMzIpOwo+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUo
Q1NSX1NUSU1FQ01QLCBuZXh0X3R2YWwgJiAweEZGRkZGRkZGKTsKPiAgI2Vsc2UKPiAgICAgICAg
ICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUCwgbmV4dF90dmFsKTsKPiAgI2VuZGlmCj4g
LS0KPiAyLjM5LjUKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
