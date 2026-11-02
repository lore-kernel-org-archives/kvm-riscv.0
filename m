Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D133606A332
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 07:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A9CqHJhj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ASvxbmSJODLmoiRZ3Ar7MHkJWxmOulpkZ2FbaGGRgso=; b=A9CqHJhjwf8ZWa8Txnid6PLSuN
	FtKFdXFHqObLd6f/nYra3QNk4rkQFVG/fX9cZoWtO5ebUkFspC12fxjTtfZZvqBMrs4blNn8uN3k/
	/KHsJVKxVTRCfuHgst1m+OhJ+UCOspuT3Rti//l1GJlelKwliJbhSmQdEcSsvHnNTNcWnPIWUn8Ca
	+tNsXgaPUgBhcYSgTS3GQDu3Lbcmw3F7odFkHL/SBR3qsejGe1nytQ6jpBwFyyezpRoQKYsxqlfbY
	iMofZ+sZb8YiZUZyNlDJuHXlN3KeGinTuadQ/7OhBshUpdaOy6MzbUv9D0nYkhFAkGd/D8oBSPuEf
	0ipfW6SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmHq-0000000FjOm-00QH;
	Mon, 02 Nov 2026 07:16:58 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmHj-0000000FjNr-1QHP
	for kvm-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 07:16:53 +0000
Received: from [127.0.0.1] (unknown [122.194.100.204])
	by APP-03 (Coremail) with SMTP id rQCowACneZrgOOhquhktAA--.47405S2;
	Mon, 02 Nov 2026 15:16:48 +0800 (CST)
Message-ID: <c5719b029fe9f7159a37bf4d56c11bca8ef61ca9.camel@iscas.ac.cn>
Subject: Re: [kvm-unit-tests PATCH 0/7] riscv: ACPI boot and BRS-I SBI tests
From: Xiang W <wangxiang@iscas.ac.cn>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, pbonzini@redhat.com,
 	thuth@redhat.com, sunilvl@oss.qualcomm.com
Date: Mon, 02 Nov 2026 15:16:48 +0800
In-Reply-To: <syzvrpkpdg5gjo4q6fgeypshwc33vzlzy3r6bvu5pqwm5iogl6@gewf5shwul3k>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
	 <syzvrpkpdg5gjo4q6fgeypshwc33vzlzy3r6bvu5pqwm5iogl6@gewf5shwul3k>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACneZrgOOhquhktAA--.47405S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYV7k0a2IF6w1UM7kC6x804xWl14x267AK
	xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj
	6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r
	xl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
	80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAF
	wVW8CwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUAVWUtwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x07jo_M3UUUUU=
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_231651_756485_70B34770 
X-CRM114-Status: UNSURE (   5.51  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMDktMzDkuInnmoQgMTM6MjIgKzAyMDDvvIxBbmRyZXcgSm9uZXPlhpnpgZPvvJoK
PiAKPiBUaGFua3MgZm9yIHRoaXMgc2VyaWVzLCBYaWFuZy4gSSdtIGdsYWQgdG8gc2VlIGt2bS11
bml0LXRlc3RzIGdldHRpbmcKPiB1c2VkLiBCdXQgcGxlYXNlIG1ha2Ugc3VyZSB5b3Ugd29yayB3
aXRoIHRoZSBSVkkgQlJTIGNvbW11bml0eSB0byBlbnN1cmUKPiB5b3VyIHdvcmsgaXMgYWxpZ25l
ZCB3aXRoIHRoZWlyIHBsYW5zLgo+IAo+IFRoYW5rcywKPiBkcmV3CkhpIERyZXcsCgpUaGFua3Mg
Zm9yIHRoZSByZXZpZXcuCgpBcyByZXF1ZXN0ZWQsIEkgaGF2ZSByZWFjaGVkIG91dCB0byB0aGUg
UlZJIEJSUyBjb21tdW5pdHkuClRoZSBkaXNjdXNzaW9uIGlzIGhlcmU6Cmh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LWJycy9pc3N1ZXMvMzA4CgooQWxzbyBzZW50IHRvIHRl
Y2gtYnJzQGxpc3RzLnJpc2N2Lm9yZykKClBsZWFzZSBsZXQgbWUga25vdyBpZiBhbnl0aGluZyBl
bHNlIGlzIG5lZWRlZC4KClRoYW5rcywKWGlhbmcKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlz
dAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
