Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD459FF494B
	for <kvm-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 06:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VrB7CDvBOIFSnVP9spwCV3+yvZd9wM3h6pR3uz5iBQ=; b=vk7JExlfNONFqW
	nM3y1eI5tNddqwGBxzIPUdp1JdL6NJTTDvl/+KVDZ+DUqcw2Vt3pawi4b09api5bJNDDTJ5Hap7+L
	bqcMaSPlNJBDV5ku3jdwcFgEulH8aFXxT9Tvq8586kH+UPlpqIxtT6Olg3L5Yw+AasZK5eyFeE1IW
	ypn7QWYjjwrtfwQQVVXXJe+6BDkahiwbk83uIlFmKdDdmnJXK8aB5/c7M1vpxBlF3Own7JPT8qkDd
	3ZmFY90LJBxJUEnG9/yv+aybCnr95+w8gihgHWmkPXG3Sk6i2hRdlKudGwb1BGgu4mJcoSzvUyHOn
	2hT0gUPSv4SZ7KxVUPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w764f-0000000AgOU-2FWY;
	Mon, 30 Mar 2026 06:26:09 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w764b-0000000AgNM-3mc6
	for kvm-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 06:26:07 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7d751ef36ccso2185617a34.0
        for <kvm-riscv@lists.infradead.org>; Sun, 29 Mar 2026 23:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774851964; cv=none;
        d=google.com; s=arc-20240605;
        b=MX1TMfOBlftZCeawVLPqj+Hogku8VDMQ3iRGl2cxwBeJgm0uH5ULACwNhE6eXDzv06
         9UYAk9OGpnDPZlfjthMlBIelRPBGQzNexIw7BbkvZ9mCLnrTGEwPBrrOZAB+5Mof7cs/
         yG0saIiNAxNRULG5I2RtJRwE6AkPqJwk61n7K4oFbeB478H2bLoF5MdK5uKIjijyKr86
         uMKjhUHRm8nUrc65BLDxRPKBRKu0lH/o/aSFBvJc1FDxl4RhqKAPx+VTZVwPhQh2wwRv
         9nwabYqAIAsEvLYTtcihm8Tf1cLAs/eI+YXy0EqueyVLrcsMrA0HQEdgMnoNfeFBQT1m
         AHgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BJL4Mjb1KkwQXihagjZYCJrbQf8hr8cjcUo/ljk+BF0=;
        fh=wByrw5BywhW2RIfjS0mEe9OauoBMUAK3KGPiuX6z0co=;
        b=ZGs+kIeebZIqrqvxoPV4BcfQlIltM74KDYO1hw/fpikj78J+Nf9cFx9oFtUatCe3AT
         e38KRGo3E0B33m94benxeLqbmBoEZr04CQ0zgzMUzfK8uLikXFdIsyjVF1vYiu657CV2
         ceWO95piwx9R3RKUakhwkS9LwxljB/OkosQm71keRDxx+gkXghpUe3yCg0t27ti++mbm
         a0g7fJpBn4C5CCmHoKBI3295443eoQJk1lDK75qICMb+o7KUsdsZ9OQhRwsHUzvkSaHG
         6HHPGFLe31RCtmJQVs/iHQkyJZa6jksAaIrN3/tzvzqE1zesu9kxUr7xvAK4ozMxf43b
         CfTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774851964; x=1775456764; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJL4Mjb1KkwQXihagjZYCJrbQf8hr8cjcUo/ljk+BF0=;
        b=p64zXO+ityeQPargcJ6KMrqSLeocaW3RhiZaalqKM13Rrkwe32dXwfpJGTgNk8v42d
         K8zOs8nw7VK6lhxY8+7r+CyG8KmxvHejubtb4PDH5W2Uv/s2QuiOw77VRL0YrhENLQi6
         +NhZQKHzQ7lMJgdqGkp4QMhC6SzZcWekGbeUb6XTHNTuor9defqq52H7nSzTEGfRZN+K
         PJ7LN7pT4KVcpqxHG5XMUauFCpsCnn5gDFzcAHf5MERlIW1hwDSfsNKMh/SXQFusJS6I
         zvx4lxMn6WZbbMhAL3QZfQv1C7muGFjzVOc+gFzdSZCDtSdlfb3E+k+HNJrv3bk0ynPC
         gliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774851964; x=1775456764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BJL4Mjb1KkwQXihagjZYCJrbQf8hr8cjcUo/ljk+BF0=;
        b=rz+0EsNv4JNXJnpEWXvoY0me3vzdzYKSAdURHOEtfRh5Pxqkat505A6ImIUP/OIrgJ
         48YDDB1L8H1RoL5Tj+U/cdu9QRODrwqppalj6Yojoed8++8U6zb1qi0VzSYkzy5/Zl1z
         NzKFmbYw88/OpUqLJB6gPETMsIyEQnXuTBlfS52vgKhJWUrDkEAUn+7xmCi//DW2tzqa
         96IsysBZUMCJDTYuG+L7JD7Mlh/f2SQHfbZR+/YgH3LPS3+d8VPtacVHgjqFmVO/1yuo
         p7G/Czt1Nn8owS8hgI1/ZmrAFJoM5w3hr+sZVZ8Evd3mObhXJmWVdo4/w2k66e1f3Mda
         YP5w==
X-Forwarded-Encrypted: i=1; AJvYcCUlaNnBEXmnlQLkOPfGCp7uVtnRokq7ievIvaQH+8WseIJ/ttEug61qKKmkKToNsI52cSRYJZog37c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8i6ucIrzC0iPslRauvSYOmqaEe4sze4y07CSxaQP6EyQ8QdW6
	AemGYWOpK83km+w+8QAJ6QEaWkZcTUQ42fEkZNXnNB13oY3KRcQBfeRO0DLPZtWH5n48J32ePZO
	EwIJ+xBhMrrykLD1uK8nTusd0Ar6yVpakznQXm1DGLQ==
X-Gm-Gg: ATEYQzzUfYrixmnDdyekmphXrrDxWRshVIqqvIPTR2Gse9aK6Cnfzm+4sv5BxJSs17O
	K2wWChwkQ+oGmvONuxsN7iQBZBAePz0K9U8aywVgJMf2v5eOqfhLR7SQ9ov71pvo6egorlD0p7D
	J91QOk3VJBs7FGPXCcjW8tHHbndpHPJ7SaEKNrKKdSMKmyr8+peQJo0GbzOfQZnjwkMil8xEPRo
	HDlgU2rEm1kcRJthbS4AAmDy2pDuHEA0YINCdeZ/0cct2VxdjRB3Oa7xLmZwvsNflOwkfyhFWo3
	wE6vGuN7GC4B60zf00/SV8qKpAQH36k/TIuS4uKpaCdVrfewbmUoXsBS7T41fJ4M5vpm6vSSywR
	yCp0YJZRKMhCUL9CC+TJZgYfB8w==
X-Received: by 2002:a05:6820:1746:b0:67e:1259:ab08 with SMTP id
 006d021491bc7-67e185f02a4mr5516515eaf.5.1774851964222; Sun, 29 Mar 2026
 23:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260316141234007qSAOsesu2cSQsj-LA-qq3@zte.com.cn> <20260316141631543e3oVI3JGADhz5veSRD_eC@zte.com.cn>
In-Reply-To: <20260316141631543e3oVI3JGADhz5veSRD_eC@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Mar 2026 11:55:52 +0530
X-Gm-Features: AQROBzDjrvHHyJxz8FHwAkL524ioyt0BKjQVXcYMmumnhJBSe00NB84q2suAzEk
Message-ID: <CAAhSdy0KBL1oTbsTVnqdcFmkcOBGs+kEyQWKmJ5iYj8MzJw0Jw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] RISC-V: KVM: Fix lost write protection on huge
 pages during dirty logging
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nutty.liu@hotmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_232606_196111_C265AB57 
X-CRM114-Status: GOOD (  19.57  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMTE6NDbigK9BTSA8d2FuZy55ZWNoYW8yNTVAenRlLmNv
bS5jbj4gd3JvdGU6Cj4KPiBGcm9tOiBXYW5nIFllY2hhbyA8d2FuZy55ZWNoYW8yNTVAenRlLmNv
bS5jbj4KPgo+IFdoZW4gZW5hYmxpbmcgZGlydHkgbG9nIGluIHNtYWxsIGNodW5rcyAoZS5nLiwg
UUVNVSBkZWZhdWx0IGNodW5rCj4gc2l6ZSBvZiAyNTZLKSwgdGhlIGNodW5rIHNpemUgaXMgYWx3
YXlzIHNtYWxsZXIgdGhhbiB0aGUgcGFnZSBzaXplCj4gb2YgaHVnZSBwYWdlcyAoMUcgb3IgMk0p
IHVzZWQgaW4gdGhlIGdzdGFnZSBwYWdlIHRhYmxlcy4gVGhpcyBjYXVzZWQKPiB0aGUgd3JpdGUg
cHJvdGVjdGlvbiB0byBiZSBpbmNvcnJlY3RseSBza2lwcGVkIGZvciBodWdlIFBURXMgYmVjYXVz
ZQo+IHRoZSBjb25kaXRpb24gYChlbmQgLSBhZGRyKSA+PSBwYWdlX3NpemVgIHdhcyBub3Qgc2F0
aXNmaWVkLgo+Cj4gUmVtb3ZlIHRoZSBzaXplIGNoZWNrIGluIGBrdm1fcmlzY3ZfZ3N0YWdlX3dw
X3JhbmdlKClgIHRvIGVuc3VyZSBodWdlCj4gUFRFcyBhcmUgYWx3YXlzIHdyaXRlLXByb3RlY3Rl
ZCByZWdhcmRsZXNzIG9mIHRoZSBjaHVuayBzaXplLiBBZGRpdGlvbmFsbHksCj4gZXhwbGljaXRs
eSBhbGlnbiB0aGUgYWRkcmVzcyBkb3duIHRvIHRoZSBwYWdlIHNpemUgYmVmb3JlIGludm9raW5n
Cj4gYGt2bV9yaXNjdl9nc3RhZ2Vfb3BfcHRlKClgIHRvIGd1YXJhbnRlZSB0aGF0IHRoZSBhZGRy
ZXNzIHBhc3NlZCB0byB0aGUKPiBvcGVyYXRpb24gZnVuY3Rpb24gaXMgcGFnZS1hbGlnbmVkLgo+
Cj4gVGhpcyBmaXhlcyB0aGUgaXNzdWUgd2hlcmUgZGlydHkgcGFnZXMgbWlnaHQgbm90IGJlIHRy
YWNrZWQgY29ycmVjdGx5Cj4gd2hlbiB1c2luZyBodWdlIHBhZ2VzLgo+Cj4gRml4ZXM6IDlkMDVj
MWZlZTgzNyAoIlJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgc3RhZ2UyIHBhZ2UgdGFibGUgcHJvZ3Jh
bW1pbmciKQo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUu
Y29tLmNuPgo+IFJldmlld2VkLWJ5OiBOdXR0eSBMaXUgPG51dHR5LmxpdUBob3RtYWlsLmNvbT4K
CkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJl
Z2FyZHMsCkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyB8IDcgKysrLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jIGIvYXJjaC9yaXNjdi9rdm0vZ3N0
YWdlLmMKPiBpbmRleCBiNjdkNjBkNzIyYzIuLmQyMDAxZDUwODA0NiAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4g
QEAgLTMwNCwxMCArMzA0LDkgQEAgdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3dwX3JhbmdlKHN0cnVj
dCBrdm1fZ3N0YWdlICpnc3RhZ2UsIGdwYV90IHN0YXJ0LCBncGFfdCBlbmQKPiAgICAgICAgICAg
ICAgICAgaWYgKCFmb3VuZF9sZWFmKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4
dDsKPgo+IC0gICAgICAgICAgICAgICBpZiAoIShhZGRyICYgKHBhZ2Vfc2l6ZSAtIDEpKSAmJiAo
KGVuZCAtIGFkZHIpID49IHBhZ2Vfc2l6ZSkpCj4gLSAgICAgICAgICAgICAgICAgICAgICAga3Zt
X3Jpc2N2X2dzdGFnZV9vcF9wdGUoZ3N0YWdlLCBhZGRyLCBwdGVwLAo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB0ZXBfbGV2ZWwsIEdTVEFHRV9PUF9X
UCk7Cj4gLQo+ICsgICAgICAgICAgICAgICBhZGRyID0gQUxJR05fRE9XTihhZGRyLCBwYWdlX3Np
emUpOwo+ICsgICAgICAgICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX29wX3B0ZShnc3RhZ2UsIGFk
ZHIsIHB0ZXAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB0ZXBf
bGV2ZWwsIEdTVEFHRV9PUF9XUCk7Cj4gIG5leHQ6Cj4gICAgICAgICAgICAgICAgIGFkZHIgKz0g
cGFnZV9zaXplOwo+ICAgICAgICAgfQo+IC0tCj4gMi4yNy4wCgotLSAKa3ZtLXJpc2N2IG1haWxp
bmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
