Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECB6CA1010
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 07:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dB87GmPQj8UobKpe1cnPlWrXhoAW5ZSQpp9r4VSSwBw=; b=aTcjWHzwbo7awW
	rWDo8IyeZtuzojkhJNvBTEB6I+PqGeggd73hRfgAHz8WPs09Eh2suq/EN/vdBaI54dUaJdHJr50MB
	DoBWvBqlEEnQZsYtPw0qfS6bwqBR7dx/A/NaICKs00O64QnpwNj8EdJc7nxW6z5rgjMPfkc2yTxR/
	Fy0lNaZt82i9jtbLtz5yvJPw6VLLb233zTuS6ujb22z8DhYaI7fqAK26V8BF9A3clSpKneckSYiXS
	a86XmWpSx3JyjVLUrFfq4gQ+QAoxircf3r3cxzxnG86jTDKympqz7zjBHdGwqsu8/X3xaceFFQSU/
	+gh5vSE8GMILDWUJ8Hvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuR9z-000000007kJ-03zG;
	Fri, 05 Sep 2025 07:47:03 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQIg-0000000HOkk-2TnA
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 06:51:59 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3f664c47acbso12619545ab.0
        for <kvm-riscv@lists.infradead.org>; Thu, 04 Sep 2025 23:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757055118; x=1757659918; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nDTd5Gv36YNMyq5Qhnn8xJEK9lVHzvftyFkSysDc/4=;
        b=XmWOTB3RpU7wIOwkfpFUooCsnO/vGACm+QRPBkM6A39jO/s3lA+ItKNgf2/bplT2zy
         4aXAOnXnZ/lbv8574zHgf/9M9wyavxeeCp2naEZedz1U6TsKM+UAlrrz4xpRxSkAF7R6
         7myqPGXWmn5drtGPhuV1n2w6NoSavhr6T9lK0KQgcBR04uzqhld27Rrp3kFfV5hiGsFP
         rEwPLrOgn84sA33vNmYV525NJJVS8TJSj51raMY+sJwW+B5uXTrg917nwMYLWRrmjiqS
         IOLvtX3GRmTOf8UN02Lh2bAW//oay731ruN5Gq24Qh6FZUAAh4Np91WBHrRiPx1Ayx3t
         RkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757055118; x=1757659918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nDTd5Gv36YNMyq5Qhnn8xJEK9lVHzvftyFkSysDc/4=;
        b=RErA3qTRHx+bj/mahByjlwW4fyv0BDzZtfXcoPoF4iAhBNVsVXNnFYPyiVhTOx44fc
         PHRKIng2N0Yd9srI6kGkCx/A6FRlUUVevAybdhU+tajkyzOLBitr5Tf7+X4y7KSNaCG3
         dJfIlHeNJ3o1L/5dhl33GTZRwudIxY72yokk74YKkVGx11VTEovUthUM1UwU1WTO6QLX
         rQCmXS/F7ypnocFmPiLP63choV6r/JFnVfYR/Bah1EGjAxGCsRz5DOUvXpBu/Yf0XsJo
         U3HHpG588+vL4NVf26qn9x0xpuUI4RLHG9412LjPmcgqYt+hH25sW3wRRPA9O8NrZOb7
         EzwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5Po8K8JovEiKoe4qIpir+0SNGIKk9zZeMBXBv1aupEOcfpkFuZ1x627idIpi6lxE6vO+bxYdkdY8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4QydP33hosya/YGB7m4D4y9XqMpeSN3QRmdRMo9LtvP5NnNEP
	ktknKsqddwV9dVwY8Lq0Gl3qKHle3HyHxQl2XtirH5jkOIOi/7fWnIIXLt2HRF9+OmptaRpmhIS
	4UQBkrgLBZgCRC8PsDYXMTpEsyGcKgA5yzJvgANf6sg==
X-Gm-Gg: ASbGncudV0xWaDZ2J7Gyyh/FXdeClW/gcIkNiujfbQNAlKp8o5dNS7Ab4wM+JeA8P6F
	/WuNI9PGGvfYw585uxfnoyIOuLVIEu6BJrAVDoBQkAolpeMCaXVDa31Y6+nmg60/YH8A5Rji6jo
	YvuFzooUTvXz7eRWfKUdmxMAbROS9/LKcbgqZ9Wubb2Fdn8MK3l3Ulw+PW/9zEr3ju5kcTH43pQ
	pWhuEnwdxnQj7t/XYO8MUpm8Fco7YLiO/yidH/CEEqsceGs443V7GewlXog6Q==
X-Google-Smtp-Source: AGHT+IFqhsp8QkbEH2AYxxy6aZR2+3njRKvf1EkNjHXrSfDyXXsLjXgWGyrgUdjW9lEocsZBNm6jnwrKVQArR5mwmho=
X-Received: by 2002:a05:6e02:4616:b0:3f6:554f:f83e with SMTP id
 e9e14a558f8ab-3f6554ff9d2mr206848225ab.18.1757055117887; Thu, 04 Sep 2025
 23:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250821142542.2472079-1-guoren@kernel.org>
In-Reply-To: <20250821142542.2472079-1-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Sep 2025 12:21:46 +0530
X-Gm-Features: Ac12FXzs-ev06L7BPaxBsQRN2id94q1V5j-qhNEmATN7a2fxkATv2aO3WzvlWf0
Message-ID: <CAAhSdy35BTE8YwxKb+1YwE3eHDfRytt71fU4014zYjwyXYn5qw@mail.gmail.com>
Subject: Re: [PATCH V4 RESEND 0/3] Fixup & optimize hgatp mode & vmid detect functions
To: guoren@kernel.org
Cc: troy.mitchell@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, fangyu.yu@linux.alibaba.com, guoren@linux.alibaba.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_235158_639980_96835492 
X-CRM114-Status: GOOD (  11.46  )
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

T24gVGh1LCBBdWcgMjEsIDIwMjUgYXQgNzo1NuKAr1BNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4KPiBIZXJlIGFyZSBzZXJ2YWwgZml4dXAgJiBvcHRtaXppdGlvbnMgZm9yIGhn
YXRwIGRldGVjdCBhY2NvcmRpbmcKPiB0byB0aGUgUklTQy1WIFByaXZpbGVnZWQgQXJjaGl0ZWN0
dXJlIFNwZWMuCj4KPiAtLS0KPiBDaGFuZ2VzIGluIHY0Ogo+ICAtIEludm9sdmUgKCJSSVNDLVY6
IEtWTTogUHJldmVudCBIR0FUUF9NT0RFX0JBUkUgcGFzc2VkIiksIHdoaWNoCj4gICAgZXhwbGFp
biB3aHkgZ3N0YWdlX21vZGVfZGV0ZWN0IG5lZWRzIHJlc2V0IEhHQVRQIHRvIHplcm8uCj4gIC0g
UkVTRU5EIGZvciB3cm9uZyBtYWlsaW5nIHRocmVhZC4KPgo+IENoYW5nZXMgaW4gdjM6Cj4gIC0g
QWRkICJGaXhlcyIgdGFnLgo+ICAtIEludm9sdmUoIlJJU0MtVjogS1ZNOiBSZW1vdmUgdW5uZWNl
c3NhcnkgSEdBVFAgY3NyX3JlYWQiKSwgd2hpY2gKPiAgICBkZXBlbmRzIG9uIHBhdGNoIDEuCj4K
PiBDaGFuZ2VzIGluIHYyOgo+ICAtIEZpeGVkIGJ1aWxkIGVycm9yIHNpbmNlIGt2bV9yaXNjdl9n
c3RhZ2VfbW9kZSgpIGhhcyBiZWVuIG1vZGlmaWVkLgo+IC0tLQo+Cj4gRmFuZ3l1IFl1ICgxKToK
PiAgIFJJU0MtVjogS1ZNOiBXcml0ZSBoZ2F0cCByZWdpc3RlciB3aXRoIHZhbGlkIG1vZGUgYml0
cwo+Cj4gR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpICgyKToKPiAgIFJJU0MtVjogS1ZN
OiBSZW1vdmUgdW5uZWNlc3NhcnkgSEdBVFAgY3NyX3JlYWQKPiAgIFJJU0MtVjogS1ZNOiBQcmV2
ZW50IEhHQVRQX01PREVfQkFSRSBwYXNzZWQKPgo+ICBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyB8
IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMg
ICB8IDM1ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yv
a3ZtL3ZtaWQuYyAgIHwgIDggKysrLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRp
b25zKCspLCAyNiBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi40MC4xCj4KClF1ZXVlZCB0aGlzIHNl
cmllcyBmb3IgTGludXgtNi4xOAoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
