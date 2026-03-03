Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94104E67A92
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 08:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blTgY2xfJmA2M5+eCd3Z4Ny/aO0TGyJExp1e9IngpGE=; b=iuRpDM4EFdrMLf
	fg63+RH9s2xlDci0/OYrUpR7vbLh2IRunWAwoOyVhReHtkccd6AzG67u6mG3jSoXLi5UdxWxORzKV
	+Qj9qpOOofeP/NVkzYpcdh1oU+qstJVjTrFkY5MgbKPB+swmGT7KFuNOXw7flmSW5E5SDlPIS2JA+
	i/fLu2T31jBjCa6Yosy5sqMbKfQ6peK37gGu60wKYttX4SfNa2JpuOTwQYbkzI9/dXrTs0nkK7gv+
	JhPklVZOMjKCNXiDwlbWdcx9NiEI3F4y2R4iAGur0uccRtHYtzI0cRhx4f3qq4Sez/g87dT2DX+0e
	+FoCubecr2G/iTG0TNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKn4-0000000El23-3sD6;
	Tue, 03 Mar 2026 08:07:38 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKn1-0000000El0v-14ok
	for kvm-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 08:07:37 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-679efb9eb0dso4342240eaf.2
        for <kvm-riscv@lists.infradead.org>; Tue, 03 Mar 2026 00:07:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772525254; cv=none;
        d=google.com; s=arc-20240605;
        b=Ei4CIUxuZ3l+iZuPCCMCkq9b0NDsRuA/3NcliRD/N+EWy8THPNFjyAQNnQX5CBzjqZ
         eh9S7o3xj8KKlPBYDnbYZV8yPcskJifAYAnECUbkX4jGrIDpVXxxQdePLPOb1Mi1zVB6
         wvE4aWArjoBUosl9JX9e3J2a9FKQuOl3q9ko6Zc7FUVi3DBvxKmuE0oBFakdfLo8Om/j
         F0B350u/IKITBDem+AXpApqPXsXthYwdCqx6b5IkExKAdUWu/iv855ML0dhXi2Ct2tEL
         R1iKIFD+bgtMDkTw3MZ7CoaAwZJlpbi/9pKb3uN2rapxUZS0a33l20WZimydGUH9GKze
         dLdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GuqFHghzfd5h3VXh4yNDT2Yb5ts6QshO2bl6Hh7Yh40=;
        fh=VkPfGygU6Vu/bNy5WMg/760FhowgcJTnDDLTTMDnB4E=;
        b=QYM9umL47WVtrYbDHsfqULnGlxqbX7BiQIyo/70efDOyHug8zICR2vutZ6pk9HUTY5
         xiTMjdCqUvOTAdq/lyMqeEApfD8cBBgxb9OeoMY7QYNqJtuQltgfiZnrwbr68uO5Tj2w
         10EqkxbT53FAYykC2ilznHMoZlC7jiex5fd6aVNUQhXTJNS+x0ibVFiUfLsxYlmu1JPk
         k2SMjZ7prQYoUSENbz5dhh5ZU1RVqBjSxvFPLaZ1sMDzgodrgsttrmyIe/svqZermVg+
         +4crFSe/1Zont+U8asMRxgiKwQO1TsqQG3QU/BlaFnuOcMbo0raCftXyBDe/9aButy/3
         SVgw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772525254; x=1773130054; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuqFHghzfd5h3VXh4yNDT2Yb5ts6QshO2bl6Hh7Yh40=;
        b=ngutDaOfHiWt+63wnyzD1hkCnvsooyws5YvgVEWXLuqRul4GOqRUO3DeEdcnn4EdeD
         W6bjqtHH4INWbPeA2hztcM7cnD154/+W84bwEQDFQ5kEckz3+jhbC/xqXV+0XA3xH77u
         zRgTyD70NB9DGGRNipLKb2mUD0Pev8zRsdJyf6TAmuarbKvTqGLylyMXAxnxp4d3Z9Pg
         PZVzuLsejjjsKOE6ObntOzvNc3fq6amStGdMhBDr3DTN1sz9PdadFwPKK988lPIoDf+k
         MpcbK32Pv03KZ6tBkr1DK0DVKRdMhIdumU3ktp2C0g2egmcV4bd1kbggnl4cgWTDeoYA
         sk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525254; x=1773130054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GuqFHghzfd5h3VXh4yNDT2Yb5ts6QshO2bl6Hh7Yh40=;
        b=t9MrNCsPCj7TxsP7X0+Osfhz8Z/KnsbmP0PCSI7hmAFeAUlCceNK+U5EkNhU7pBhhW
         UK4YgvZXC3qPBce2o/wLVLCof2XhKxYEJeUR/JZtfJt7TDOwqzCdiUAuI//EM0nsLIHA
         KoJToAh2c85H2Vj9RFh0MJHNiVxPUkDBVHrIonu6BNN8mCVyQ6Atv8kJe6llTp0/2h2s
         nBb4rSDw2m1IEac8KxElgDZAXzdrWVq+P+QYMLPcpygrDNwRoJkYXzAmbp+h90SUEfx1
         Qx06iRJqu4x32TphvmcZ8Tr/TERZbncaPIKCAQVBumqPTebdbr1lrA+f2wZ/JVn+xLrQ
         MIBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRvzEJcFG3YstnJ8VOXLRqYr+euSq4Cy7QlOBBA2pvyertcTAG74SY4CUkh6jgwL8XcnbbKJ52qtQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrnLYkTgf8FO32Bws/YNJT7TfF59MNN6kwRIXEjj0xDsa+wP0V
	JNAoxDLPlRJhiAE+4EB37P3XpINZan9RGxTfgfFZ7AUBE7ECjAYSjXAgYh0raVzGWWAMS1LgA9O
	YQ6Zz1Zyz4Fn4nQ0y4VSYtGCIOXNP1+u9SB0+UIu3DQ==
X-Gm-Gg: ATEYQzy2vv1ysZrZSOrJMedTftyIoUEeVmL5IAl4IqEVBmt4EboZJ5ziMb64v1q6aLM
	eAPYuq6NeXE9kpeA9yvAR0cjUZmC88K1KaqLEgy45u4Fg3Jd3q2DJyEcwhBspvPeI/sJrHuiEh4
	yILr1WoqkZIVnk2KLYIct8qq/SlUG2QmuaVK+8ZQtyD9YiW6lWzCyP+46/tSND0cwwMUYDfHCcV
	vdeVvL+H481H/7+nG2AF9X7frlqU1AVtr2VbKxT9fOCEm8esIuScqKj8sVLGps4SqZYv6tV1OAY
	ayXfThFaHJ+AHVDX4x8s1tbRcpR+maKHd1cVuCxPg/yp6FhyA743vQC0AGW3OI92pYe5BexjkCv
	eofXqzWK1jGIUZQN7K1c6lfXKsA==
X-Received: by 2002:a05:6820:201c:b0:662:f74d:69f5 with SMTP id
 006d021491bc7-679fae7d3dfmr8743971eaf.31.1772525253820; Tue, 03 Mar 2026
 00:07:33 -0800 (PST)
MIME-Version: 1.0
References: <20260226172245358qVZavIykLL2QC0KoqTO-I@zte.com.cn>
In-Reply-To: <20260226172245358qVZavIykLL2QC0KoqTO-I@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 3 Mar 2026 13:37:22 +0530
X-Gm-Features: AaiRm51tbzRHHGrkI3BQgXsKymJuy3CHgi-XuP_FlIJWr5ikP6Oe5JI6W0vZKCk
Message-ID: <CAAhSdy2uJxYX6r1K=EWEqqYoZ1BjJDqkYC+Byv_3Wy65xDyCaw@mail.gmail.com>
Subject: Re: RISC-V: KVM: Fix hugepage mapping handling during dirty logging
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_000735_552876_342EF2CC 
X-CRM114-Status: GOOD (  16.19  )
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

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgMjo1MuKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gV2hlbiBkaXJ0eSBsb2dnaW5nIGlzIGVuYWJsZWQsIHRoZSBnc3RhZ2UgcGFnZSB0
YWJsZXMgbXVzdCBiZSBtYXBwZWQKPiBhdCBQQUdFX1NJWkUgZ3JhbnVsYXJpdHkgdG8gdHJhY2sg
ZGlydHkgcGFnZXMgYWNjdXJhdGVseS4gQ3VycmVudGx5LAo+IGlmIGEgaHVnZSBQVEUgaXMgZW5j
b3VudGVyZWQgZHVyaW5nIHRoZSB3cml0ZS1wcm90ZWN0IGZhdWx0LCB0aGUgY29kZQo+IHJldHVy
bnMgLUVFWElTVCwgd2hpY2ggYnJlYWtzIFZNIG1pZ3JhdGlvbi4KPgo+IEluc3RlYWQgb2YgcmV0
dXJuaW5nIGFuIGVycm9yLCBkcm9wIHRoZSBodWdlIFBURSBhbmQgbWFwIG9ubHkgdGhlIHBhZ2UK
PiB0aGF0IGlzIGN1cnJlbnRseSBiZWluZyBhY2Nlc3NlZC4gVGhpcyBvbuKAkWRlbWFuZCBhcHBy
b2FjaCBhdm9pZHMgdGhlCj4gb3ZlcmhlYWQgb2Ygc3BsaXR0aW5nIHRoZSBlbnRpcmUgaHVnZSBw
YWdlIGludG8gc21hbGwgcGFnZXMgdXBmcm9udC4KPgo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgWWVj
aGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29tLmNuPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9n
c3RhZ2UuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgYi9hcmNoL3Jp
c2N2L2t2bS9nc3RhZ2UuYwo+IGluZGV4IGI2N2Q2MGQ3MjJjMi4uMTZjOGFmZGFmYmZiIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0v
Z3N0YWdlLmMKPiBAQCAtMTM0LDcgKzEzNCw3IEBAIGludCBrdm1fcmlzY3ZfZ3N0YWdlX3NldF9w
dGUoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwKPgo+ICAgICAgICAgd2hpbGUgKGN1cnJlbnRf
bGV2ZWwgIT0gbWFwLT5sZXZlbCkgewo+ICAgICAgICAgICAgICAgICBpZiAoZ3N0YWdlX3B0ZV9s
ZWFmKHB0ZXApKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUVYSVNUOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHNldF9wdGUocHRlcCwgX19wdGUoMCkpOwoKTWFraW5nIGEg
bGVhZiBQVEUgaW52YWxpZCBtdXQgYmUgZm9sbG93ZWQgYnkgVExCIGludmFsaWRhdGlvbgp1c2lu
ZyBnc3RhZ2VfdGxiX2ZsdXNoKCkuCgpJIHRoaW5rIHJldHVybmluZyAtRUVYSVNUIGlzIHRoZSBy
aWdodCB0aGluZyB0byBkbyBoZXJlIGJlY2F1c2UKY2FsbGVyIGhhcyB0byBzcGxpdCBhIGh1Z2Ug
UFRFIHdpdGggcHJvcGVyIFRMQiBpbnZhbGlkYXRpb24uCgpSZWdhcmRzLApBbnVwCgotLSAKa3Zt
LXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
