Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B68E606A320
	for <kvm-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O47JIAkl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=fritz.com header.i=@fritz.com header.a=rsa-sha256 header.s=mail header.b=AmiP1sdZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4STy877tE6PpmahUoD1/nUMjVhUjZ81HmP4P7zeAflA=; b=O47JIAkloH5/JZKMZIEGgqgPKK
	J3a1355Sh17EksSX0WGkJxSweyFs/m0VFIHWy0M+CHxE5eQ9ekR0q2p9uW0Vcq+sI3T2xMSUXLNX+
	HJAYYO0zKCALpfX3U+6aUW92fbz8PJvwqVuRyg4WjYei5xu21Lpaj+JSklcUktJIhgaZXxN1f6+Gp
	0PO4ooWN7ghx6oHpD9Wazccljkw5SQY1DdkOdtrOp3cK0QwRdRQp7n0AS4s2bOnUcBOIRPTIBbQ3U
	XMBkdt57HWpYcQDEdZa120wbcxg2C72dSOQ6+UA9K/ttu/BX3NucXmckFu4dao3Yt3pQc/yvdjCTu
	nFHxI6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmg3-0000000BklQ-2Ozf;
	Fri, 30 Oct 2026 13:29:51 +0000
Received: from mail.avm.de ([212.42.244.94])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmg0-0000000Bkks-2OIc;
	Fri, 30 Oct 2026 13:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1793366980; bh=a/fEt90n+2smzc8tULN5m3m/hMMA3WQXHcvWhcoynLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmiP1sdZKE4ipmV9XkFzIAg6sDdTc8piKssit8JG5M7jVm+wWoA9HNBcL6nnioxmf
	 UtVWmWL8HC8cipXhGGKFKn344d7QBy4BigwXDhd9cibHOOYqfnPwcm+wl7S8LyH40H
	 PIcRpdlbp12mkcZ/qVoxVXxHxdsVB4yBgm4K8e8Gb7j8o5MGT6HVOS52CCT1ImUgYM
	 rC8fGm5esO5fYtQK82TXSmpyrCUdX6hUkhNuydSuiEjRPAEuIkSRJ3Vr5CzOMuVEiE
	 +YmeA56zTDNX6G2v3XBcddEQclfpxGdALH3GP+htSNoKgdV3GvyPoPiSSRu1+yw2Ux
	 Cmo8WDvejZ5Lw==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6ae49bc4-23c8-7f0000032729-7f0000019970-1
	for <multiple-recipients>; Fri, 30 Oct 2026 14:29:40 +0100
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 30 Oct 2026 14:29:40 +0100 (CET)
Date: Fri, 30 Oct 2026 14:29:39 +0100
From: Nicolas Schier <n.schier@fritz.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Luis Augenstein <luis.augenstein@tngtech.com>,
	Maximilian Huber <maximilian.huber@tngtech.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, soc@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Mark Rutland <mark.rutland@arm.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Atish Patra <atish.patra@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
	netdev@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 13/13] treewide: Stop defining __ASSEMBLY__ for
 assembler files
Message-ID: <20261030-dexterous-manatee-of-honor-eac4eb@l-nschier-z2>
References: <20261023064908.66707-1-thuth@redhat.com>
 <20261023064908.66707-14-thuth@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261023064908.66707-14-thuth@redhat.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1793366980-B27F8EE4-FD80AEC5/0/0
X-purgate-type: clean
X-purgate-size: 2843
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-03  mail-id: CA9E3A07A1  external: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_062949_043596_5C3DBFD2 
X-CRM114-Status: GOOD (  13.23  )
X-Spam-Score: -4.4 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8062170216944425130=="
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8062170216944425130==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FhzCQO4A3K0b968D"
Content-Disposition: inline

--FhzCQO4A3K0b968D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 08:48:50AM +0200, Thomas Huth wrote:
> All spots have been changed to __ASSEMBLER__ (i.e. the macro that
> gets defined by the compiler), so we don't have to manually define
> __ASSEMBLY__ anymore.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Makefile                                             | 2 +-
>  arch/alpha/boot/compressed/Makefile                  | 2 +-
>  arch/arm64/kernel/vdso32/Makefile                    | 1 -
>  arch/loongarch/vdso/Makefile                         | 2 +-
>  arch/mips/boot/compressed/Makefile                   | 2 +-
>  arch/mips/vdso/Makefile                              | 2 +-
>  arch/powerpc/boot/Makefile                           | 2 +-
>  arch/powerpc/platforms/cell/spufs/Makefile           | 2 +-
>  arch/s390/Makefile                                   | 2 +-
>  arch/x86/boot/Makefile                               | 2 +-
>  arch/x86/boot/compressed/Makefile                    | 2 +-
>  arch/x86/realmode/rm/Makefile                        | 2 +-
>  arch/xtensa/kernel/Makefile                          | 2 +-
>  drivers/firmware/efi/libstub/Makefile                | 2 +-
>  drivers/net/wan/Makefile                             | 2 +-
>  scripts/Makefile.build                               | 2 +-
>  scripts/gfp-translate                                | 2 +-
>  scripts/headers_install.sh                           | 1 -
>  scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py | 2 +-
>  tools/testing/selftests/kvm/lib/riscv/handlers.S     | 4 ----
>  tools/testing/selftests/vDSO/vgetrandom-chacha.S     | 2 --
>  21 files changed, 17 insertions(+), 25 deletions(-)
>=20

Reviewed-by: Nicolas Schier <n.schier@fritz.com>


--FhzCQO4A3K0b968D
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEDv+Fiet06YHnC6RpiMa8nIiabbgFAmrkm8MACgkQiMa8nIia
bbgYnhAAoBtAI6CuFq9HQy+0LMEBBrZiObTja20n/nhSog1KoLUqfiUozqhmkZ/q
CT6UauaVVL+guGjUkQd4MU9Y4sF+qy0kKmfzavbo/MIofHFX6fypq5WinV83BS4k
PfHvku6pkGUFMvVkCliG3iiJVbANl4MGycOY5VxIXI9veRse6+SRuWaP5fqRD0dv
XZHNc+ZmLOMmkijTKgYUq7fUIdBhxmeq4Px5Q0aq0cESHCORoGOcUcdASB8KRxr/
S2whk42NUvuQxJF/S68XDQ9N3LdkhPBY2Y0GHdcJ+esswGxGJVb7rfY38dRXkz8R
a/X59L/D+n6k/1v/xfmmj36rd/INoushZOa+gNXEg5KPwORqTYICzhwVlfZz5mdv
0XgTKePC+FBeKnCHfJjMK1P6SAnag5q59vu8MXmzNGH9HIhm2PzyPhRrPYA4lwBl
N1Hh9kQBBwy4oEdLX69syKiLtIA3mDxbo80VqRIUm6MpUjxkTbkAgLQgfXDRz2M0
Wa9/fDB/O1tJKj8IR8V+jbjPqz5/6/fNkpD9/6fpqvBgeD2vkjOk3q/IvTq5gvHK
ApKpaLY5DYJBXdX80Rm5ofEmFac0/p9C+eX3ovHAHFIG7JPR5kTF3fwDtbSbP7z6
ghTZsJCcqEgyM22oqOSpskYbUmxnPEnUkGMg6K1a7KZPgUJQ9zA=
=Pwya
-----END PGP SIGNATURE-----

--FhzCQO4A3K0b968D--


--===============8062170216944425130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

--===============8062170216944425130==--

