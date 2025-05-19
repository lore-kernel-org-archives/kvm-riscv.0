Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB9BC2D0CD
	for <kvm-riscv@archiver.kernel.org>; Mon, 19 May 2025 12:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWZwTsxKZQreT5vzAk09RlXjsDvkYxXc09ybvrdfoxQ=; b=EtyxaNPC83NvER
	oonEWYA4wXNyy0oQm+SW3fzKCHO84Wo4cgzKEY6IlSl/1ssj+d9bx/wPTwu+xxV64E784n6Exz5J5
	nCFp/tJfc9NgRtCyOMFqxlA+nCjRaVhdhp/1C3QBpoEHXgVq18gbBOKknGrhgY3jk+RMjJCL0Qk5L
	/Xr/xADlQyIW5BtFrrnYpkzV4rWQaVSXv98UYGqUoqct5rt5zkhv1zjnafh/dbN8+PNnKEUdzu/HK
	Bj7Q+sdeqJg3s9Qfa7ztOuyXd0SET0Sy1VHFM5dRudaf9dqZhj4tU9UcyaYe+YrkF+1adhBqZFrGz
	lJJaW5ogvjZiFMFjRyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzkU-00000009Ark-1Ag1;
	Mon, 19 May 2025 12:37:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzYr-000000098i6-1Cwv
	for kvm-riscv@lists.infradead.org;
	Mon, 19 May 2025 12:25:43 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a374754e03so34239f8f.1
        for <kvm-riscv@lists.infradead.org>; Mon, 19 May 2025 05:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747657539; x=1748262339; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYOuWvhD2IrISJ7Y8B2LTWIZ7qteHjlohGpX67eP4RQ=;
        b=eZq7Qg2HmFge7j1Bg+LArnOETapdvlx5NBFfQPx3KCYWih7nmk6WfA5tQR7LjlXjit
         9h77ReL7k9/fhBvMo2uo+1YlXFp/yC7sDqDbR+f1HDAF9ABtfHzVjzDsIsfAZsq960JS
         H6+PI1kKIDD3ssQL4odwYiYPeHjq+cmjSrm5CvfSMRjb8FatCbTa6HRVGqWfjPSzVoOh
         SaECn3F7XeQCfrajvbjPTj3Z0tiXyM80mPzNf0LDevYviz2oXvpF8o2pBu4e83c/n9Q5
         8tBbznyDSi8vhrrNlAQKIcNAR5Fdi3J3IeBWERyB9gmxQFQN06CfXrCqAIFvkZq4iIqK
         vdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747657539; x=1748262339;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dYOuWvhD2IrISJ7Y8B2LTWIZ7qteHjlohGpX67eP4RQ=;
        b=QgNHuHVxBT2Jubtv3UW+lUl5Zr/IzNMrYOre3UdTGjHMQCgnr3Nu6tJpGUg3pFfiPV
         A1YttIQb7Ni8IeQJQ0gouQgHNHwhEIhJ3sLeBHpjfmsnFjoU1Dc/btQNTyGKvPRYQYIr
         B6+LW4NTaUNq0laygeXRl/uwdXdd3pRodYsUN7yxsM+8d11vBjrpugYxvTfir8s2a8Ao
         TxCXIWPv8TFSvvdrK7HpHCn1/ggkxTFOQsU6ip6N1aaJxR8z+hHN0EramUOeo8Wd2UVe
         iBZAPZZm4IJyxe2KQ2qONPRetefRFL76lvsGbtXPnH7cUlPI0xhcUkjrvGI9m5JEcPXs
         6CsA==
X-Gm-Message-State: AOJu0YzFhaD9C4QBU7IY38bzOlvaU9/73c2z1886RIBLLYdmA8gJcMJh
	f36Dmkpmqx7v65JX+Pb7JnFMe1g+/nk6Z2GVR4BDEFeO9dyMyG6v67FxZYdOt085+20=
X-Gm-Gg: ASbGncuyZqZezQ4Q4Tbv8LTmhJepjF9Bi5oAeDfwMFHS1vkm2TjV+eOJe013FJ4OlUC
	PdSn6Bo0JohDSl93OUGe7QOgEl31lvzPLbQ+rAmoMVoSazGgr3qvBsc/W9Iap42k6Pzf+hdiPAi
	sbgnrZcn2osrhEwqrB/yYiudc28nB0xrEnquYq3ucWwVHn5vA3FewCq7d/fmYF09b8jkwhVy65i
	6/Uf77bYtKuxU8mpsg+k68pMzyIqEq5JEW6Gfqlw67bdkVUjhA2xRcSMHVfcoEr6MWmy1OHVoSG
	xIJPzIa29sjGei4VwEDfva54v09YNqVmeOmt2Xgs9lj/SgkN4DVsjsHQK5o=
X-Google-Smtp-Source: AGHT+IGD0SGS0rGbL2ckKskUyJdOJSyzovDYQ2VXjwxG5bR2UNb0kyCq4qlYyH1RbivwrICgl0vwjQ==
X-Received: by 2002:a5d:5888:0:b0:3a3:7351:6f39 with SMTP id ffacd0b85a97d-3a373517245mr709772f8f.15.1747657539155;
        Mon, 19 May 2025 05:25:39 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:29b7:4911:a29c:2135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f33804d9sm209160935e9.12.2025.05.19.05.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 05:25:38 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 19 May 2025 14:25:36 +0200
Message-Id: <DA04W4PO99EJ.1XWOAUMZV4BXG@ventanamicro.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
 <20250515143723.2450630-5-rkrcmar@ventanamicro.com>
 <CAAhSdy1Z43xRC7tGS21-5rcX7uMeuWCHhABSuqNzELbp26aj0Q@mail.gmail.com>
In-Reply-To: <CAAhSdy1Z43xRC7tGS21-5rcX7uMeuWCHhABSuqNzELbp26aj0Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_052541_316799_9DEE316F 
X-CRM114-Status: GOOD (  14.84  )
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

MjAyNS0wNS0xNlQxNzo1NTowNSswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gVGh1LCBNYXkgMTUsIDIwMjUgYXQgODoyMuKAr1BNIFJhZGltIEtyxI1tw6HFmSA8
cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4KPj4gQWRkIGEgdG9nZ2xlYWJsZSBW
TSBjYXBhYmlsaXR5IHRvIHJlc2V0IHRoZSBWQ1BVIGZyb20gdXNlcnNwYWNlIGJ5Cj4+IHNldHRp
bmcgTVBfU1RBVEVfSU5JVF9SRUNFSVZFRCB0aHJvdWdoIElPQ1RMLgo+Pgo+PiBSZXNldCB0aHJv
dWdoIGEgbXBfc3RhdGUgdG8gYXZvaWQgYWRkaW5nIGEgbmV3IElPQ1RMLgo+PiBEbyBub3QgcmVz
ZXQgb24gYSB0cmFuc2l0aW9uIGZyb20gU1RPUFBFRCB0byBSVU5OQUJMRSwgYmVjYXVzZSBpdCdz
Cj4+IGJldHRlciB0byBhdm9pZCBzaWRlIGVmZmVjdHMgdGhhdCB3b3VsZCBjb21wbGljYXRlIHVz
ZXJzcGFjZSBhZG9wdGlvbi4KPj4gVGhlIE1QX1NUQVRFX0lOSVRfUkVDRUlWRUQgaXMgbm90IGEg
cGVybWFuZW50IG1wX3N0YXRlIC0tIElPQ1RMIHJlc2V0cwo+PiB0aGUgVkNQVSB3aGlsZSBwcmVz
ZXJ2aW5nIHRoZSBvcmlnaW5hbCBtcF9zdGF0ZSAtLSBiZWNhdXNlIHdlIHdvdWxkbid0Cj4+IGdh
aW4gbXVjaCBmcm9tIGhhdmluZyBhIG5ldyBzdGF0ZSBpdCBpbiB0aGUgcmVzdCBvZiBLVk0sIGJ1
dCBpdCdzIGEgdmVyeQo+PiBub24tc3RhbmRhcmQgdXNlIG9mIHRoZSBJT0NUTC4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+Cj4+
IC0tLQo+PiBJZiB3ZSB3YW50IGEgcGVybWFuZW50IG1wX3N0YXRlLCBJIHRoaW5rIHRoYXQgTVBf
U1RBVEVfVU5JTklUSUFMSVpFRAo+PiB3b3VsZCBiZSByZWFzb25hYmxlLiAgS1ZNIGNvdWxkIHJl
c2V0IG9uIHRyYW5zaXRpb24gdG8gYW55IG90aGVyIHN0YXRlLgo+Cj4gWWVzLCBNUF9TVEFURV9V
TklOSVRJQUxJWkVEIGxvb2tzIGJldHRlci4gSSBhbHNvIHN1Z2dlc3QKPiB0aGF0IFZDUFUgc2hv
dWxkIGJlIHJlc2V0IHdoZW4gc2V0X21wc3RhdGUoKSBpcyBjYWxsZWQgd2l0aAo+IE1QX1NUQVRF
X1VOSU5JVElBTElaRUQgYW5kIHRoZSBjdXJyZW50IHN0YXRlIGlzCj4gTVBfU1RBVEVfU1RPUFBF
RC4KClRoYXQgd291bGQgcmVzdWx0IGluIHR3byByZXNldHMgKHN0b3BwZWQgLT4gdW5pbml0aWFs
aXplZCAtPiAqKSwgdW5sZXNzCndlIGNoYW5nZWQgdGhlIGxvZ2ljLgoKV291bGQgeW91IHByZWZl
ciB0byByZXNldCBvbiB0cmFuc2l0aW9uIHRvIHRoZSBuZXcgcGVybWFuZW50IG1wX3N0YXRlPwpN
UF9TVEFURV9JTklUX1JFQ0VJVkVEIHNlZW1zIGEgbW9yZSBmaXR0aW5nIG5hbWUgZm9yIHRoZSBz
dGF0ZSwgdGhlbi4KClRoYW5rcy4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
